class Market
  attr_reader :name, :vendors, :vendor_names

  def initialize(name)
    @name = name
    @vendors = []
    @vendor_names = []
  end

  def add_vendor(vendor)
    @vendors << vendor
    @vendor_names << vendor.name
  end

  def vendors_that_sell(item)
    vendors = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item1, amount|
        if item1 == item
          vendors << vendor
        end
      end
    end
    vendors
  end
end
