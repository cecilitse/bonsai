require 'rails_helper'

RSpec.describe 'Users - Session creation', version: 1, type: :request do
  let!(:cecile) { create(:user, id: 1, email: 'cecile@mail.com', password: 'coucoulechat') }

  before :each do
    allow(Rails.application).to receive(:secret_key_base).and_return('3b09b46f0daa01f1de9762531c9a2ce3')
  end

  context 'when provided credentials are correct' do
    let(:params) do
      {
        user: {
          email:    'cecile@mail.com',
          password: 'coucoulechat'
        }
      }
    end

    it 'signs in a user' do
      post '/api/users/session', headers: accept_header, params: params
      json_response = JSON.parse(response.body)

      expect(response.status).to        eq(200)
      expect(json_response['token']).to eq('eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.RORJAfIuhJuMDap0Ov94775of7GjahUE1kZ1oUxnQTQ')
    end
  end

  context 'when provided email does not exist' do
    let(:params) do
      {
        user: {
          email:    'unknown-user@mail.com',
          password: 'coucoulechat'
        }
      }
    end

    it 'rejects user sign in' do
      post '/api/users/session', headers: accept_header, params: params
      expect(response.status).to eq(401)
    end
  end

  context 'when provided password is not correct' do
    let(:params) do
      {
        user: {
          email:    'cecile@mail.com',
          password: 'wrong-password'
        }
      }
    end

    it 'rejects user sign in' do
      post '/api/users/session', headers: accept_header, params: params
      expect(response.status).to eq(401)
    end
  end
end
