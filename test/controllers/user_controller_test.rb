require 'test_helper'

class UserControllerTest < ActionController::TestCase
   test "true" do
     assert true
   end

  test "creates" do
    user = User.create
    assert user.save
  end

  test "should destroy user" do
    user = User.create
    user.destroy
    assert_response :success
  end

  test "should index user" do
    User.create
    assert_response :success
  end

end
