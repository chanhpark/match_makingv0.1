require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message

  scenario 'provide valid registration information' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path

    fill_in 'Email', with: "jognas@gmail.com"
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    select user.birthday.strftime("%d"), from: "user_birthday_3i"
    select I18n.translate("date.month_names")[user.birthday.month], from: "user_birthday_2i"
    select user.birthday.strftime("%Y"), from: "user_birthday_1i"
    fill_in 'Zip code', with: user.zip_code
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    save_and_open_page

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
