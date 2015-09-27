require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @business = @user.businesses.create(store_num: 7, phone: "798-987-3859", name: "Big Boy")
  end

  test "fixture is valid" do
    @user.valid?
  end

  test "can create user" do
    @user = User.new(email: "test2@test.com", phone: "234-856-2389", f_name: "Billy", level: 0)
    @user.password = "testword"
    assert @user.save
  end

  test "can delete user" do
    assert @user.delete
  end

  test "user can create business" do
    @business = @user.businesses.create(store_num: 7, phone: "798-987-3859", name: "Big Boy")
    assert @user.businesses.find(@business.id).valid?
  end

  test "user can delete business" do
    assert @user.businesses.find(@business.id).delete
  end

  test "user email cannot be blank" do
    @user.email = nil
    refute @user.valid?
    assert @user.errors.include? :email
  end

  test "new user password cannot be blank" do
    new_user = @user.dup
    new_user.password = nil
    refute new_user.valid?
    assert new_user.errors.include? :password
  end
end
