class InitVerificationSession
  def initialize(person, document, photos)
    @person   = person 
    @document = document
    @photos   = photos
  end

  def call 
    session_id = create_new_verification_session

    if session_id 
      add_photo_to_session(@photos.face, session_id)
      add_photo_to_session(@photos.document_back, session_id)
      add_photo_to_session(@photos.document_front, session_id)

      notify_veriff_for_review(session_id)
    end 
  end

  private

  def create_new_verification_session
    api_response = init_session
    parsed_body = JSON.parse(api_response.body)
    
    if api_response.success?
      VerificationSession.transaction do
        VerificationSession.create(
          id: parsed_body["verification"]["id"],
          status: VerificationSession::SUBMITTED,
          user_id: @person.id,
          document_id: @document.id
        )
      end

      return parsed_body["verification"]["id"] 
    end 
  end

  def add_photo_to_session(photo, session_id)
    begin
      HTTParty.post(VeriffBaseApi::API_URL + "sessions/" + session_id + "/media",
        body: parse_photo(photo),
        headers: VeriffBaseApi.headers(parse_photo(photo)) 
      )
    rescue => e
      Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
    end
  end

  def notify_veriff_for_review(session_id)
    begin 
      HTTParty.patch(VeriffBaseApi::API_URL + "sessions/" + session_id,
        body: submit_review_body,
        headers: VeriffBaseApi.headers(submit_review_body) 
      )
    rescue => e
      Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
    end

  end

  def init_session
    begin 
      HTTParty.post(VeriffBaseApi::API_URL + "sessions",
        body: verification_body,
        headers: VeriffBaseApi.headers(verification_body) 
      )
    rescue => e
      Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
    end
  end

  def submit_review_body 
    {
      "verification" => {
        "frontState" =>  "done",
        "status" => "submitted",
        "timestamp" => Time.now.iso8601
      }
    }.to_json
  end

  def parse_photo(photo)
    {
      "image" => {
        "context" => photo.name.to_s.gsub(/_/, "-"),
        "content" => "data:#{photo.content_type};base64,#{Base64.strict_encode64(open(photo.path) { |f| f.read })}",
        "timestamp" => Time.now.iso8601
      }
    }.to_json
  end

  def verification_body
    {
      "verification" => {
        "person" => {
          "firstName" => @person.first_name,
          "lastName" => @person.last_name,
          "idNumber" => @person.id_number
        },
        "document" => {
          "number" => @document.number,
          "type" =>  @document.document_type,
          "country" => CS.countries.invert[@document.country].to_s
        },
        "additionalData" => {
          "citizenship" => "EE",
          "placeOfResidence" => "Tallinn"
        },
        "lang" => "en",
        "features" => ["selfid"],
        "timestamp" => Time.now.iso8601
      }
    }.to_json
  end 
end

