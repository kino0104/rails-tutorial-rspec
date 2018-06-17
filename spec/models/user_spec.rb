require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  # userが有効であること
  it "is valid" do
    expect(@user).to be_valid
  end
  
  # 名前がなければ無効な状態であること
  it "is invalid without name" do
    @user.name = ""
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
  end
  
  # メールアドレスがなければ無効な状態であること
  it "is invalid without email" do
    @user.email = ""
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end
end
