require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    it 'should be valid with all fields set' do
      @category = Category.create(name: 'a')
      @product = @category.products.new(name: 'a', price: 1, quantity: 1)
      expect(@product).to be_valid
    end
    
    
    it 'should be invalid without a name' do
      @category = Category.create(name: 'a')
      @product = @category.products.new(name: nil, price: 1, quantity: 1)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should be invalid without a price' do
      @category = Category.create(name: 'a')
      @product = @category.products.new(name: 'a', price: nil, quantity: 1)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'should be invalid without a quantity' do
      @category = Category.create(name: 'a')
      @product = @category.products.new(name: 'a', price: 1, quantity: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should be invalid without a quantity' do
      @product = Product.new(name: 'a', price: 1, quantity: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end   


  end

end
