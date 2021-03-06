require 'menu'
require 'order'

describe Menu do

  dish1 = {dish_name: 'Vegan Fish & Chips', dish_price: '12'}
  dish2 = {dish_name: 'Vegan Sausages', dish_price: '2'}

  subject(:menu) { described_class.new([dish1, dish2]) }

  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it "allows customer to see dishes available" do
    expect(menu).to respond_to(:list_dishes)
  end

  it "will return a list of dishes" do
    expect(menu.list_dishes).to eq "Vegan Fish & Chips, £12\nVegan Sausages, £2\n"
  end

  it "to order the meal I want, be able to select dishes available" do
      menu.select_dish('Vegan Sausages', 2)
      expect(menu.get_order).to eq [{dish_name: 'Vegan Sausages', quantity: 2}]
  end

end
