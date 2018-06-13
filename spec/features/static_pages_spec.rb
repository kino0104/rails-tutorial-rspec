require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  let(:base_title){
    "Ruby on Rails Tutorial Sample App"
  }
  
  describe "#home" do
    
    it "should get root" do
      visit root_url
      expect(page).to have_http_status(:success)
    end
    
    it "タイトルが正しいこと" do
      visit static_pages_home_path
      expect(page).to have_http_status(:success)
      expect(page).to have_title "Home | #{base_title}"
    end
  end
  
  describe "#help" do
    it "タイトルが正しいこと" do
      visit static_pages_help_path
      expect(page).to have_http_status(:success)
      expect(page).to have_title "Help | #{base_title}"
    end
  end
  
  describe "#about" do
    it "タイトルが正しいこと" do
      visit static_pages_about_path
      expect(page).to have_http_status(:success)
      expect(page).to have_title "About | #{base_title}"
    end
  end
  
  describe "#contact" do
    it "タイトルが正しいこと" do
      visit static_pages_contact_path
      expect(page).to have_http_status(:success)
      expect(page).to have_title "Contact | #{base_title}"
    end
  end
end
