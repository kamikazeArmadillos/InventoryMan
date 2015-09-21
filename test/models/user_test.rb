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
    @user = User.new(email: "test@test.com", phone: "234-856-2389", f_name: "Billy", password_digest: "password", level: 0)
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

  test "user phone cannot be blank" do
    @user.phone = nil
    refute @user.valid?
    assert @user.errors.include? :phone
  end

  test "user f_name cannot be blank" do
    @user.f_name = nil
    refute @user.valid?
    assert @user.errors.include? :f_name
  end

  test "user password cannot be blank" do
    @user.password_digest = nil
    refute @user.valid?
    assert @user.errors.include? :password_digest
  end

  test "user level cannot be blank" do
    @user.level = nil
    refute @user.valid?
    assert @user.errors.include? :level
  end
end
