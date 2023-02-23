require 'rails_helper'

RSpec.describe 'Group page', type: :feature do
  before(:each) do
    @user = User.create(name: 'test', email: '123@gmail.com', password: 'password')
    Group.create(name: 'Food', icon: 'https://123', user_id: 1)
    visit user_session_path
    fill_in 'Email', with: '123@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_groups_path(@user.id)
  end

  it 'expect to have div_card' do
    expect(page).to have_css('.index_group_entity_container_div_new')
  end
  it 'I can see the page title.' do
    expect(page).to have_content 'Categories'
  end
  it 'I can see the group total transaction.' do
    expect(page).to_not have_content 'Total: $'
  end
end
