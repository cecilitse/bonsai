module Users
  class AuthenticateService
    private

    attr_reader :email, :password, :user

    public

    def initialize(email:, password:)
      @email    = email
      @password = password
    end

    def call
      load_user
      return nil unless user
      return nil unless user_authenticated?

      return generate_jwt_token
    end

    private

    def generate_jwt_token
      secret  = Rails.application.secret_key_base
      payload = { user_id: user.id }

      JWT.encode(payload, secret, 'HS256')
    end

    def load_user
      @user = User.find_by_email(email)
    end

    def user_authenticated?
      user.valid_password?(password)
    end
  end
end
