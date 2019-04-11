require 'rails_helper'

describe Users::AuthenticateService, type: 'service' do
  subject(:service) { Users::AuthenticateService.new(params) }

  let!(:user) { create(:user, email: 'claire@mail.com', password: 'sunshine') }

  before :each do
    allow(Rails.application).to receive(:secret_key_base).and_return('3b09b46f0daa01f1de9762531c9a2ce3')
  end

  describe '#call' do
    context 'when correct credentials are provided' do
      let(:params) do
        {
          email:    'claire@mail.com',
          password: 'sunshine'
        }
      end

      it 'returns a token' do
        expect(service.call).to eq('eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.RORJAfIuhJuMDap0Ov94775of7GjahUE1kZ1oUxnQTQ')
      end
    end

    context 'when incorrect credentials are provided' do
      let(:params) do
        {
          email:    'claire@mail.com',
          password: 'incorrect-password'
        }
      end

      it 'returns nothing' do
        expect(service.call).to be_nil
      end
    end
  end
end
