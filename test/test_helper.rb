ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  module APIHelper
    extend self

    def headers(user = nil)
      headers = { "Content-Type": "application/json" }
      if user
        headers["Authorization"] = "Token token=#{user.token}"
      end
      headers
    end

    def parse_body(response)
      JSON.parse(response.body)['data']
    end
  end
end
