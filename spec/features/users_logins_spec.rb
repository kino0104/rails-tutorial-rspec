require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  scenario "user logins with invalid information" do
    visit login_path

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"
    
    expect(page).to have_css "div.alert-danger"
    visit current_path
    expect(page).to_not have_css "div.alert-danger"
  end
end
