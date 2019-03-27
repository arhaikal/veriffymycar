require 'rails_helper'

RSpec.describe 'Receive webhooks', type: :request do
  context 'veriff' do
    let(:user) { FactoryBot.create(:user) }   
    let(:document) { FactoryBot.create(:document) }   
    let(:verification_session) { FactoryBot.create(:verification_session) }   

    it 'returns session with status submitted' do
      expect(verification_session.status).to eq('submitted')
    end

    context 'decision' do
      let(:params_str){ '{"status":"success","verification":{"id":"a4c0a230-859a-4861-b99b-ac39e4a05bfd","status":"resubmission_requested","code":9103,"reason":"Photos are not from the same document.","acceptanceTime":"2017-09-26T12:27:55.000Z","person":{"firstName":"Morton","lastName":"Stracke","idNumber":"48002020011"},"document":{"number":"AA0052283","type":"ID_CARD","validFrom": "2017-02-27", "validUntil": "2022-02-27"},"comments":[{"type": "General Comment", "comment": "Person refuses to take off hat.", "timestamp": "2017-10-10T13:18:44.009Z"}],"additionalVerifiedData":{}},"technicalData":{"ip":"124.153.46.66"}}'}
      before { post '/webhooks/receive/', params: params_str, headers:{'content-type':"application/json",'x-auth-client'=>"8e4f7cd8-7a19-4d7d-971f-a076407ee03c",'x-signature'=>'328b360ef2bd2d6b8aa19b41ec5840f3cae94754ac0cfc11484d4ca84a82d9fd'} }
      before { verification_session.update(status: "verified")}

      it 'user has a verified session' do
        expect(verification_session.status).to eq('verified')
      end
    end
  end
end
