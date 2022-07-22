require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validation Specs" do 
    
    before do 
      @user = User.new(
        firstname: "Harshbir", lastname:"Singh", 
        email:"testmail@c.com", 
        password:"abcdef", password_confirmation:"abcdef")
    end

    it "Should not be valid if password feilds don't match" do 
      @user.password = "abcdeg"
      expect(@user).to_not be_valid
    end

it "Should not allow new user with duplicate email" do 

  @user2 = User.new(        
  firstname: "Kevin", 
  lastname:"Thomas", 
  email:"TestMail@c.com", 
  password:"c", password_confirmation:"c")

  @user2.save

  expect(@user2).to_not be_valid

end

    it "Should not have empty email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "Should not have empty firstname" do
      @user.firstname = nil
      expect(@user).to_not be_valid
    end

    it "Should not have empty firstname" do
      @user.lastname = nil
      expect(@user).to_not be_valid
    end

    it "Should have a password to minimum length 5" do 

      @user.password = "1234"

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end

  end

    

  describe '.authenticate_with_credentials' do
    before do 
      @user = User.new(
        firstname: "Harshbir", lastname:"Singh", 
        email:"testmail@c.com", 
        password:"abcdef", password_confirmation:"abcdef")
        @user.save
    end

    it 'Should authenticate if password and email are valid' do
      verified_user = User.authenticate_with_credentials(@user.email,@user.password)

    expect(verified_user).to eq @user
    
  end    

  it 'Should authenticate if password and email are valid' do
    verified_user = User.authenticate_with_credentials(" testmail@c.com ",@user.password)

  expect(verified_user).to eq @user
  
end    

it 'should authenticate even if email is in wrong case' do
  verified_user = User.authenticate_with_credentials(" tesTmail@c.com ",@user.password)

expect(verified_user).to eq @user

end  

  end

end
