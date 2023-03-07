require './lib/item'
require './lib/vendor'
require 'rspec'

describe Vendor do
  it 'can #initialize' do
  vendor = Vendor.new("Rocky Mountain Fresh")

  expect(vendor).to be_a(Vendor)
  end

  it 'has proper attributes' do
  vendor = Vendor.new("Rocky Mountain Fresh")

  expect(vendor.name).to eq("Rocky Mountain Fresh")
  expect(vendor.inventory).to eq({})
  end

  it 'can stock items and check stock' do
  vendor = Vendor.new("Rocky Mountain Fresh")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})

  expect(vendor.check_stock(item1)).to eq(0)

  vendor.stock(item1, 30)

  expect(vendor.inventory).to eq({item1=>30})
  expect(vendor.check_stock(item1)).to eq(30)
  end

  it 'can add to stock and add more than 1 item' do
  vendor = Vendor.new("Rocky Mountain Fresh")
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})
  vendor.stock(item1, 30)
  vendor.stock(item1, 25)
  vendor.stock(item2, 12)

  expect(vendor.check_stock(item1)).to eq(55)
  expect(vendor.inventory).to eq({item1=>55, item2=>12})
  end
end

