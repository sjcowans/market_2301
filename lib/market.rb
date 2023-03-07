class Market
  attr_reader :name, :vendors, :vendor_names

  def initialize(name)
    @name = name
    @vendors = []
    @vendor_names = []
    @item_count = Hash.new(0)
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
    if vendors == []
      @vendors.each do |vendor|
        vendor.inventory.each do |item1, amount|
          if item1.name == item
            vendors << vendor.name
          end
        end
      end
    end
    vendors
  end

  def sorted_item_list
    item_list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        @item_count[item.name] += amount
        item_list << item.name
      end
    end
    item_list.sort.uniq
  end

  def total_inventory
    total_inventory = {}
    items = sorted_item_list
    items.each do |item|
      total_inventory[item] = 
      {
      "quantity" => @item_count[item],
      "vendors" => vendors_that_sell(item)
      }
    end
    total_inventory
  end

  def overstocked_items
    items = total_inventory
    item_array = []
    items.each do |item , info|
      if info["quantity"] > 50 && info["vendors"].length > 1
        item_array << item
      end
    end
    item_array.join(", ")
  end
end
