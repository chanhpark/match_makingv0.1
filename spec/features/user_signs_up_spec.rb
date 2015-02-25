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
    profile = FactoryGirl.create(:profile)

    visit new_user_registration_path

    fill_in 'Email', with: "jognas@gmail.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content("Start your Profile")


    fill_in 'First Name', with: profile.first_name
    fill_in 'Last Name', with: profile.last_name
    select profile.birthday.strftime("%d"), from: "profile_birthday_3i"
    select I18n.translate("date.month_names")[profile.birthday.month], from: "profile_birthday_2i"
    select profile.birthday.strftime("%Y"), from: "profile_birthday_1i"
    fill_in 'Zip Code', with: profile.zip_code
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
