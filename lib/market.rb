class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
   @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(uniq_item)
    @vendors.find_all do |vendor|
      vendor.inventory.has_key?(uniq_item)
    end
  end

  def sorted_item_list
    sorted = []
    @vendors.each do |ven|
      sorted << ven.inventory.keys
    end
    sorted.flatten.uniq.sort
  end

  def total_inventory
    sum = Hash.new(0)
    @vendors.each do |ven|
        ven.inventory.each do |item, amount|
          sum[item] += amount
      end
    end
    sum
  end

  def sell(name, quantity)
    @vendor.each do |ven|
      ven.inventory.each do |name, amount|
        if amount <= quantity
          false
        end
      end
    end
  end
end
