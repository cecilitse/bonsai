require 'rails_helper'

describe Users::AuthorizeService, type: 'service' do
  subject(:service) { Users::AuthorizeService.new(auth_token) }

  let!(:user) { create(:user, email: 'claire@mail.com', password: 'sunshine') }

  before :each do
    allow(Rails.application).to receive(:secret_key_base).and_return('3b09b46f0daa01f1de9762531c9a2ce3')
  end

  describe '#call' do
    context 'when correct token is provided' do
      let(:auth_token) { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.RORJAfIuhJuMDap0Ov94775of7GjahUE1kZ1oUxnQTQ' }

      it 'returns the user' do
        expect(service.call).to eq(user)
      end
    end

    context 'when incorrect token is provided' do
      let(:auth_token) { 'incorrect-token' }

      it 'returns nothing' do
        expect(service.call).to be_nil
      end
    end
  end
end
