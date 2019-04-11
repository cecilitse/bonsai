module Requests
  module HeadersHelpers
    def accept_header
      api_version = self.class.metadata[:version]
      raise 'version metadata should be set' unless api_version

      {
        'Accept' => "application/json;version=#{api_version}",
      }
    end

    def auth_headers(user)
      token = Users::AuthenticateService.new(
        email:    user.email,
        password: user.password
      ).call

      accept_header.merge("Authorization" => token)
    end
  end
end
