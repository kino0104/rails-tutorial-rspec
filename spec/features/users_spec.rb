require 'rails_helper'

RSpec.feature "Users", type: :feature do
  
  scenario "user visits signup page"do
    visit signup_path
    expect(page).to have_http_status(:success)
    expect(page).to have_title full_title("Sign up")
  end
end
