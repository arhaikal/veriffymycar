require 'httparty'
class VeriffBaseApi
  #constants
  API_URL = "https://api.veriff.me/v1/".freeze
  API_KEY = "651b112a-76f7-4a86-a93d-2cc9ace74c1c".freeze
  API_SECRET = '3c184872-6929-43d9-91d5-9e68468b5aa1'.freeze 

  def self.headers(verification_body)
    {
      'Content-Type' => 'application/json',
      'X-AUTH-CLIENT' => API_KEY,
      'X-SIGNATURE' => VeriffBaseApi.decode_secret(verification_body)
    }
  end

  def self.decode_secret(extra_load)
    extra_load = extra_load.to_json if extra_load.instance_of? Hash
    extra_load = StringIO.new(extra_load) unless extra_load.instance_of? StringIO

    signature = Digest::SHA256.new
    signature << extra_load.string
    signature << StringIO.new(API_SECRET).string

    signature.hexdigest
  end 

  def self.is_signature_valid?(incoming_signature, extra_load)
    extra_load = extra_load.to_json unless extra_load.is_a?(String)
    extra_load = StringIO.new(extra_load) unless extra_load.instance_of? StringIO

    signature = Digest::SHA256.new
    signature << extra_load.string
    signature << API_SECRET

    return signature.hexdigest == incoming_signature
  end
end
