require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require "pry"

class VendorTest <  Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_vendor_exists
    assert_instance_of Vendor, @vendor
  end

  def test_vendor_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_vendor_has_stock
    expected = {}
    assert_equal expected, @vendor.inventory
    assert_equal 0, @vendor.check_stock("Peaches")
    @vendor.stock("Peaches", 30)
    expected = {
      "Peaches" => 30
    }
    assert_equal 30, @vendor.check_stock("Peaches")
  end

  def test_can_check_stock_for_unique_item
   @vendor.stock("Peaches", 30)
   @vendor.stock("Peaches", 25)
   assert_equal 55, @vendor.check_stock("Peaches")
  end

  def test_can_add_additional_items_and_count
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)
    expected = {
      "Peaches"=>55,
      "Tomatoes"=>12
    }
    assert_equal expected, @vendor.inventory
  end


end
