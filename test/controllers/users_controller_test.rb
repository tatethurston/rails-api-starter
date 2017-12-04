require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'POST /users creates a user' do
    user_data = { name: 'Tate', email: 'tatethurston@gmail.com', password: 'test' }
    post users_url, params: user_data.to_json, headers: APIHelper.headers
    assert_not_nil APIHelper.parse_body(response)['token']
  end
end
