require 'rails_helper'

describe 'Categories page', type: :system do
  before do
    @user = create :user
    visit new_user_session_path

    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
  end

  scenario 'index page' do
    expect(page).to have_text 'Categories'
    expect(page).to have_link 'New Category'
    expect(page).to have_current_path groups_path
  end

  scenario 'new page' do
    click_link 'New Category'

    expect(page).to have_text 'New Category'
    expect(page).to have_current_path new_group_path
  end
end
