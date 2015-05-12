require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user=User.new(name:"test", email:"yuanyuan@email.com", password:"test123", password_confirmation:"test123")
  end

  test "User should be valid!" do
  	assert @user.valid?
  end

  test "name should not be empty" do
  	@user.name = ""
  	assert_not @user.valid?
  end
  
  test "name should not be too long" do
  	@user.name = "a"*51
  	assert_not @user.valid?
  end

  test "Email should not be empty" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "Email should have correct format!" do
  	@user.email = "test"
  	assert_not @user.valid?
  end

  test "Email should not be too long" do
  	@user.email = "a" * 254 + "@test.com"
  	assert_not @user.valid?
  end

 test "Email should be unique" do
 	duplicate_user = @user.dup
 	duplicate_user.email = @user.email.upcase
 	@user.save
 	assert_not duplicate_user.valid?
 end

  test "password length should be at least 6" do
  	@user.password = @user.password_confirmation = "test"
  	assert_not @user.valid?
  end

end
