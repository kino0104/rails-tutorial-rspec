require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  let(:user){ FactoryGirl.create(:user) }
  
  scenario "user logins with invalid information" do
    visit login_path

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"
    
    expect(page).to have_css "div.alert-danger"
    visit current_path
    expect(page).to_not have_css "div.alert-danger"
  end
  
  scenario "user logins with valid information followed by logout" do
    
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    
    expect(page).to_not have_link login_path
    expect(page).to have_link href: logout_path
    expect(current_path).to eq user_path(User.last)
    
    click_on "Log out"
    expect(page).to have_link href: login_path
    expect(page).to_not have_link href: logout_path
    expect(current_path).to eq root_path
    #expect(page).to_not have_link user_path(:user)
  end
end
