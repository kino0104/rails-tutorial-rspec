require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  let(:user){ FactoryGirl.create(:user) }
  let(:archer){ FactoryGirl.create(:user, :archer) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #edit" do
    it "should redirect edit when not logged in" do
      get :edit, params: { id: user.id }
      expect(flash).to_not be_empty
      expect(response).to redirect_to login_url 
    end
    
    it "should redirect edit when logged in as wrong user" do
      log_in_as(archer)
      
      get :edit, params: { id: user.id }
      expect(flash).to be_empty
      expect(response).to redirect_to root_url
    end
  end
  
  describe "PATCH #update" do
    it "should redirect update when not logged in" do
      patch :update, params: { id: user.id, user: { name: user.name, email: user.email } }
      
      expect(flash).to_not be_empty
      expect(response).to redirect_to login_url 
    end
    
    it "should redirect update when logged in as wrong user" do
      log_in_as(archer)
      
      patch :update, params: { id: user.id, user: { name: user.name, email: user.email } }
      
      expect(flash).to be_empty
      expect(response).to redirect_to root_url
    end
  end
end
