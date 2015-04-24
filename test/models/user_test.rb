require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "creates" do

    user = User.new
    # assert_difference('User.count') do
    # post :create, user: {uid: '1'}
    ## end
    assert user.save
  end


end
