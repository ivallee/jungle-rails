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
    xit 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)

      # @order = Order.new(...)
      # 2. build line items on @order
      # ...
      # 3. save! the order - ie raise an exception if it fails (not expected)
      # @order.save!
      # 4. reload products to have their updated quantities
      # @product1.reload
      # @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end
