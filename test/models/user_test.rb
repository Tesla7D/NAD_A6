require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: "Grigory", email: "grikzyrev@gmail.com",
                        password: "12345678a", password_confirmation: "12345678a")
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
