require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'POST /sessions returns a token' do
    user = FactoryBot.create(:user, password: 'test')
    post sessions_url, params: { email: user.email, password: 'test' }.to_json, headers: APIHelper.headers
    assert_equal user.token, APIHelper.parse_body(response)["token"]
  end
end
