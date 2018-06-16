require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  let(:base_title){
    "Ruby on Rails Tutorial Sample App"
  }
  
 
  scenario "user visits root url" do
    visit root_path
    expect(page).to have_http_status(:success)
    expect(page).to have_title full_title
  
    expect(page).to have_link href: root_path, count: 2
    expect(page).to have_link href: help_path
    expect(page).to have_link href: about_path
    expect(page).to have_link href: contact_path
    
    visit contact_path
    expect(page).to have_title full_title("Contact")
  end
  
  scenario "user visits help page" do
    visit help_path
    expect(page).to have_http_status(:success)
    expect(page).to have_title full_title("Help")
  end
  
  scenario "user visits about page" do
    visit about_path
    expect(page).to have_http_status(:success)
    expect(page).to have_title full_title("About")
  end
  
  scenario "user visits contact page" do
    visit contact_path
    expect(page).to have_http_status(:success)
    expect(page).to have_title full_title("Contact")
  end
end
