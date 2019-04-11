module API
  module V1
    class BaseController < ActionController::API
      attr_reader :current_user

      protected

      def authorize_user
        auth_header = request.headers['Authorization']
        return head :unauthorized if auth_header.blank?

        auth_token    = auth_header.split(' ').last
        @current_user = Users::AuthorizeService.new(auth_token).call

        return head :unauthorized unless @current_user
      end
    end
  end
end
