class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    value = 0
    @inventory.each { |k,v| if k == item then value = v end }
    value
  end

  def stock(item, number)
    @inventory[item] += number
  end
end
