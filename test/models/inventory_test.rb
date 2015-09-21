require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  def setup
    @inventory = inventories(:one)
  end

  test "fixture is valid" do
    @inventory.valid?
  end

  test "can create inventory" do
    @inventory = Inventory.create(name: "test", count: 1)
    assert @inventory.valid?
  end

  test "can delete inventory" do
    assert @inventory.delete
  end

  test "inventory name cannot be blank" do
    @inventory.name = nil
    refute @inventory.save
    assert @inventory.errors.include? :name
  end

  test "inventory count cannot be blank" do
    @inventory.count = nil
    refute @inventory.save
    assert @inventory.errors.include? :count
  end
end
