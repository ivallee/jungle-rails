require 'rails_helper'

RSpec.feature "Users can log in and are taken to the homepage", type: :feature, js: true do

  before :each do
    @user = User.create!(
      name: 'a',
      email: 'a@a.a',
      password: '1234',
      password_confirmation: '1234'
    )
  end

  scenario 'they see that they are logged in' do

    visit '/login'

    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password
      click_button 'Submit'
    end

    expect(page).to have_content @user.email

  end

end
