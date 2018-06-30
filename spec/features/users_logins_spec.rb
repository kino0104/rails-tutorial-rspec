require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  let(:user){ FactoryGirl.create(:user) }
  
  before do
    visit login_path
  end
  
  scenario "user logins with invalid information" do
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"
    
    expect(page).to have_css "div.alert-danger"
    visit current_path
    expect(page).to_not have_css "div.alert-danger"
  end
  
  scenario "user logins with valid information followed by logout" do
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
  
  scenario "user logins with remembering" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    check "Remember me on this computer"
    click_button "Log in"
    expect(cookies(:remember_token)).to_not be_empty
  end
  
  scenario "user logins without remembering" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(cookies(:remember_token)).to be_nil
  end

end
