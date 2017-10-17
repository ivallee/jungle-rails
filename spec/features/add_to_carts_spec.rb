require 'rails_helper'

RSpec.feature 'A visitor can add items to the cart', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

    scenario 'they see the \'my cart\' has updated' do

      visit root_path
      first('article.product').find_link('Add').click
      save_screenshot 'cart.png'

      expect(page).to have_link 'My Cart (1)'

    end

end
