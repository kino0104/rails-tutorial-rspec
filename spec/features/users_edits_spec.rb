require 'rails_helper'

RSpec.feature "UsersEdits", type: :feature do
  let(:user){ FactoryGirl.create(:user) }
  
  scenario "user edits own profile with invalid params" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    
    visit edit_user_path(user)
    
    fill_in "Name", with: ""
    fill_in "Email", with: "foo@invalid"
    fill_in "Password", with: "foo"
    fill_in "Password confirmation", with: "bar"
    click_on "Save changes" 
    
    expect(user.reload.name).to eq user.name
    expect(user.reload.email).to eq user.email
    expect(page).to have_selector ".alert-danger", text: "The form contains 4 errors"
  end
  
  scenario "user edits own profile with friendly forwarding successfully" do
    visit edit_user_path(user)
    
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    
    expect(current_path).to eq edit_user_path(user)

    fill_in "Name", with: "Foo Bar"
    fill_in "Email", with: "foo@bar.com"
    click_on "Save changes"
    
    expect(user.reload.name).to eq "Foo Bar"
    expect(user.reload.email).to eq "foo@bar.com"
    
    expect(page).to have_selector ".alert-success", count: 1
  end
end
