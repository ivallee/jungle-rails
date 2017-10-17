require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'after creation' do
    before :each do
      @category1 = Category.create!(name: 'apparel')
      @category2 = Category.create!(name: 'furniture')
      @product1 =  @category1.products.create!(name: 'shirt', price: 20, quantity: 12)
      @product2 = @category2.products.create!(name: 'couch', price: 800, quantity: 5)
      @product3 = @category2.products.create!(name: 'shelf', price: 150, quantity: 7)
    end
    it 'deducts quantity from products based on their line item quantities' do
      @order = Order.new(stripe_charge_id: 1, total_cents: 1)
      @order.line_items.new(
        product: @product1,
        quantity: 5,
        item_price: 1, 
        total_price: 1
        )
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: 1, 
        total_price: 1
        )
      @order.save!
      @product1.reload
      @product2.reload

      expect(@product1.quantity).to eq(7)
      expect(@product2.quantity).to eq(3)
    end
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(stripe_charge_id: 1, total_cents: 1)
      @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: 1, 
        total_price: 1
        )
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: 1, 
        total_price: 2
        )
      @order.save!
      @product3.reload
      expect(@product3.quantity).to eq(7)
    end
  end
end
