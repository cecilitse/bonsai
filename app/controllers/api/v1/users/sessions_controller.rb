module API
  module V1
    module Users
      class SessionsController < ActionController::API
        def create
          auth_service = ::Users::AuthenticateService.new(
            email:    credentials_params[:email],
            password: credentials_params[:password]
          )

          token = auth_service.call

          if token
            render json: { token: token }
          else
            head :unauthorized
          end
        end

        private

        def credentials_params
          params.require(:user).permit(:email, :password)
        end
      end
    end
  end
end
