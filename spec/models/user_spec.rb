require 'rails_helper'

describe User do
  describe "Validations" do
    before do
      @user = User.new name: "user", email: "matt@example.com", password: "password"
      @user.skip_confirmation!
      @user.save!
    end

    it "should not be saved if email is a duplicate" do   
      expect(User.count).to eq 1
      
      
      another_user = User.new name: "matt", email: "matt@example.com", password: "password"
      another_user.skip_confirmation!
      expect{another_user.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(another_user.errors).to be_added :email, :taken
      
      expect(User.count).to eq 1
    end

    it "should save a user if all input is valid" do
      expect(User.count).to eq 1

      another_user = User.new name: "jim", email: "jim@example.com", password: "password"
      another_user.skip_confirmation!
      another_user.save!

      expect(User.count).to eq 2
    end
  end  
end