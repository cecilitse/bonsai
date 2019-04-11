module Users
  class AuthorizeService
    private

    attr_reader :payload, :token

    public

    def initialize(token)
      @token = token
    end

    def call
      decode_token
      return unless payload

      return load_user
    rescue JWT::DecodeError
      return nil
    end

    private

    def decode_token
      secret   = Rails.application.secret_key_base
      @payload = JWT.decode(token, secret, true, { algorithm: 'HS256' })[0]
    end

    def load_user
      @user = User.find(payload['user_id'])
    end
  end
end
