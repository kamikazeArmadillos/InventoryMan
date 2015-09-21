require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
  end

  test "fixture is valid" do
    @business.valid?
  end

  test "can create business" do
    @business2 = Business.create(name: "test", store_num: 7, phone: "893-389-3849")
    assert @business2.valid?
  end

  test "can delete business" do
    assert @business.delete
  end

  test "business name cannot be blank" do
    @business.name = nil
    refute @business.valid?
    assert @business.errors.include? :name
  end

  test "business store_num cannot be blank" do
    @business.store_num = nil
    refute @business.valid?
    assert @business.errors.include? :store_num
  end

  test "business phone cannot be blank" do
    @business.phone = nil
    refute @business.valid?
    assert @business.errors.include? :phone
  end

  test "business can create inventory" do
    @inv = @business.inventories.create(name: "cone", count: 1)
    assert @business.inventories.find(@inv.id).valid?
  end
end
