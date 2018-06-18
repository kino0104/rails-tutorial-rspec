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
  
  # 名前が50文字以内でなければ無効な状態であること
  it "is invalid unless name is within 50 characters" do
    @user.name = "a" * 51
    @user.valid?
    expect(@user.errors[:name]).to include("is too long")
  end
  
  # メールアドレスが255文字以内でなければ無効な状態であること
  it "is invalid unless email is within 255 characters" do
    @user.email = "a" * 244 + "@example.com"
    @user.valid?
    expect(@user.errors[:email]).to include("is too long")
  end
end
