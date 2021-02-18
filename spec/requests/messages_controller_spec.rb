require 'rails_helper'

RSpec.describe MessagesController, type: :request do
  describe 'create' do
    let(:params) { { message: { body: 'Hello fellow Badgers', to: '+447840060990', from: Settings.from_number } } }
    let(:make_request) { post '/messages', headers: headers, params: params }

    context 'with the correct auth headers' do
      let(:headers) { { 'Authorization' => 'Bearer Bodger123' } }

      it 'should return with unauthenticated' do
        make_request
        expect(response.status).to eq(401)
      end
    end

    context 'with the correct auth headers' do
      let(:headers) { auth_headers }

      it 'should return with 200' do
        make_request
        expect(response.status).to eq(204)
      end
    end
  end
end
