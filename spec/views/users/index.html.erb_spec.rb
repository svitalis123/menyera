require 'rails_helper'
RSpec.describe 'Login Page', type: :feature do
  before(:each) do
    User.create(name: 'test', email: 'test@gmail.com', password: 'password')
    visit user_session_path
  end
  describe 'tests for view login' do
    scenario 'Login page has the username and password inputs and the Submit button.' do
      expect(page).to have_field(type: 'email')
      expect(page).to have_field(type: 'password')
      expect(page).to have_button(type: 'submit')
    end

    scenario 'user log in' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'Categories'
    end

    scenario 'invalid user data redirect to sign in' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(current_path).to eq '/users/sign_in'
    end
  end
end
