require 'httparty'
class VeriffBaseApi
  #constants
  API_URL = ENV["VERIFF_API_URL"]
  API_KEY = ENV["VERIFF_API_KEY"]
  API_SECRET = ENV["VERIFF_API_SECRET"]

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
