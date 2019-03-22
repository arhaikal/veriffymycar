require 'httparty'
class VeriffBaseApi
  #constants
  API_URL = "https://api.veriff.me/v1/".freeze
  API_KEY = "651b112a-76f7-4a86-a93d-2cc9ace74c1c".freeze
  API_SECRET = "e31afa6a-4040-49d0-b080-b46d573a9ddd".freeze 

  def self.decode_secret(extra_load)
    extra_load = extra_load.to_json if extra_load.instance_of? Hash
    extra_load = StringIO.new(extra_load) unless extra_load.instance_of? StringIO

    signature = Digest::SHA256.new
    signature << extra_load.string
    signature << StringIO.new(API_SECRET).string

    signature.hexdigest
  end 

  def self.make_api_call
    HTTParty.post(API_URL + "sessions",
      body: VeriffBaseApi.body,
      headers: { 
        'Content-Type' => 'application/json',
        'X-AUTH-CLIENT' => API_KEY,
        'X-SIGNATURE' => VeriffBaseApi.decode_secret(VeriffBaseApi.body)
      } 
    )
  end


  def self.make_get_call(verification_id)
    HTTParty.get(API_URL + "sessions/" + verification_id + "/person",
      headers: { 
        'X-AUTH-CLIENT' => API_KEY,
        'X-SIGNATURE' => VeriffBaseApi.decode_secret(verification_id)
      } 
    )
  end
end
