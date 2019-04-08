class ApiConstraints
  attr_reader :version

  def initialize(options)
    @version = options.fetch(:version)
  end

  def matches?(request)
    request
      .headers
      .fetch(:accept)
      .match?(/.*version=#{version}\z/)
  end
end
