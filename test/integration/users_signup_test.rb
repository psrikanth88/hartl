require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # endur test is to verify that clicking the signup button results in not creating a new user when the submitted information is invalid. (Writing a test for the error messages is left as an exercise (Section 7.7).) The way to do this is to check the count of users, and under the hood our tests will use the count method available on every Active Record class, including User:

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: '', email: "user@fsdg",
                              password: "fgfg", password_confirmation: "dfs"}
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name:"gd", email: "a@a.com",
                              password: "qwerty", password_confirmation: "qwerty"}
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
