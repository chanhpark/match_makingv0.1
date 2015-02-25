require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do

  scenario 'specify valid credentials' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password


    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Profile')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'user does not have a profile' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Start your Profile")
  end

  scenario 'user does have a profile' do
    profile = FactoryGirl.create(:profile)

    visit new_user_session_path

    fill_in 'Email', with: profile.user.email
    fill_in 'Password', with: profile.user.password
    click_button 'Log in'

    expect(page).to have_content("#{profile.first_name}")
    expect(page).to have_content("#{profile.last_name}")
  end
end
