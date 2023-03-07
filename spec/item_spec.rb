require './lib/item'
require 'rspec'

describe Item do
  it 'can #initialize' do
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})

  expect(item1).to be_a(Item)
  expect(item2).to be_a(Item)
  end

  it 'has correct attributes' do
  item1 = Item.new({name: 'Peach', price: "$0.75"})
  item2 = Item.new({name: 'Tomato', price: '$0.50'})

  expect(item2.name).to eq("Tomato")
  expect(item2.price).to eq(0.5)
  end
end