require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'
require "pry"

class MarketTest <  Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_3 = Vendor.new("Palisade Peach Shack")
  end

  def test_market_exists
    assert_instance_of Market, @market
  end

  def test_market_name
    assert_equal "South Pearl Street Farmers Market", @market.name
  end
end
