class VeriffActions
  def self.update_session_status(request_body)
    request_body = JSON.parse(request_body)
    session = VerificationSession.find(request_body["verification"]["id"])

    if session
      status= case request_body["verification"]["code"]
              when 9001,9151,9161 then 'verified'
              else 'unverified'
              end
      session.status = status
      session.save!
    end
  end
end