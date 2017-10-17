require 'rails_helper'

RSpec.feature "User navigates from homepage to product detail page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "they see the product details" do

    visit root_path

    first('article.product').find_link('Details').click
    
    expect(page).to have_content 'Product Reviews:'
    # save_screenshot 'product-detail.png'

  end

  
end
