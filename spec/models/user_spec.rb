require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
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
    expect(@user.errors[:name]).to include("is too long (maximum is 50 characters)")
  end
  
  # メールアドレスが255文字以内でなければ無効な状態であること
  it "is invalid unless email is within 255 characters" do
    @user.email = "a" * 244 + "@example.com"
    @user.valid?
    expect(@user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end
  
  # メールアドレスが有効なフォーマットであれば有効な状態であること
  it "is valid with email is valid format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
     valid_addresses.each do |valid_address|
       @user.email = valid_address
       expect(@user).to be_valid
     end
  end
  
  # メールアドレスが有効なフォーマットでなければ無効な状態であること
  it "is invalid unless email is valid format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end
  end
  
  # メールアドレスが一意なら有効な状態であること
  it "is valid with unique email" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    duplicate_user.valid?
    expect(duplicate_user.errors[:email]).to include("has already been taken")
  end
  
  # メールアドレスが大文字・小文字混在でも登録時に小文字に変換されること
  example " email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq @user.reload.email 
  end
  
  # パスワードが存在しなければ(ブランクでなければ)無効な状態であること
  it "is invalid with password blank" do
    @user.password = @user.password_confirmation = " " * 6
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end
  
  # パスワードが6文字以上でなければ無効な状態であること
  it "is invalid unless password length is more than 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    @user.valid?
    expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end
