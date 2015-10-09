require 'rails_helper'

describe Event do
  before do
    @user = User.new name: "user", email: "email@email.com", password: "password"
    @user.skip_confirmation!
    @user.save!

    @application = Application.new name: "application", url: "http://www.url.com", user: @user
    @application.save!
  end

  describe "Validations" do
    it "should not save without a name" do
      event = Event.new application: @application
      expect{event.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(event.errors).to be_added :name, :blank
    end

    it "should not save without a user" do
      event = Event.new name: "event"
      expect{event.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(event.errors).to be_added :application, :blank
    end

    it "should be saved if valid" do
      expect(Event.all.count).to eq 0
      Event.create! name: "event", application: @application
      expect(Event.all.count).to eq 1
    end
  end

  describe "Dependencies" do
    it "should not save if it does not belong to an application" do
      event = Event.new name: "name"
      expect{event.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(event.errors).to be_added :application, :blank
    end

    it "should be deleted if its application is deleted" do
      expect(Event.all.count).to eq 0
      Event.create! name: "event", application: @application
      
      expect(Event.all.count).to eq 1
      @application.destroy!

      expect(Event.all.count).to eq 0
    end
  end
end