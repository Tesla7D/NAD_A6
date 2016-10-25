require 'test_helper'

class CodepostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @codepost = Codepost.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @codepost.valid?
  end

  test "user id should be present" do
    @codepost.user_id = nil
    assert_not @codepost.valid?
  end
end
