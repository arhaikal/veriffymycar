class InitVerificationSession
  def initialize(person, document)
    @person = person 
    @document = document
  end

  def create_new_verification_session
    api_response = init_session
    parsed_body = JSON.parse(api_response.body)
    
    if api_response.success?
      VerificationSession.transaction do
        VerificationSession.create(
          id: parsed_body["verification"]["id"],
          user_id: @person.id,
          document_id: @document.id
        )
      end
    end 

  end

  def init_session
    HTTParty.post(VeriffBaseApi::API_URL + "sessions",
      body: verification_body,
      headers: { 
        'Content-Type' => 'application/json',
        'X-AUTH-CLIENT' => VeriffBaseApi::API_KEY,
        'X-SIGNATURE' => VeriffBaseApi.decode_secret(verification_body)
      } 
    )
  end

  private 

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
          "country" => @document.country
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

