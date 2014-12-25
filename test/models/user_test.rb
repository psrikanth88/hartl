require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example user", email: "user@example.com",
                    password: "foobar",password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end
end