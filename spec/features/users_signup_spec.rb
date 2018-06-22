require 'rails_helper'

RSpec.feature "Users", type: :feature do
  
  scenario "user signups with invalid values "do
    visit signup_path
    expect(page).to have_http_status(:success)
    expect(page).to have_title full_title("Sign up")
    expect {
      fill_in "Name", with: ""
      fill_in "Email", with: "user@invalid"
      fill_in "Password", with: "foo"
      fill_in "Confirmation", with: "bar"
      click_on "Create my account"
      
      expect(page).to have_css "div#error_explanation"
      expect(page).to have_css "div.field_with_errors"
    }.to_not change(User, :count)
  end
  
  scenario "user creates account" do
    visit signup_path
    expect {
      fill_in "Name", with: "Example User"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"
      click_on "Create my account"
      expect(page).to have_css "div.alert-success"
    }.to change(User, :count).by(1)
    
    
  end
end
