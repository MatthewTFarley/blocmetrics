require 'rails_helper'

describe Application do
  describe "Validations" do
    before do
      @user = User.new name: "user", email: "matt@example.com", password: "password"
      @user.skip_confirmation!
      @user.save!
      @app = Application.new user: @user
    end

    it "should not be saved if name is missing" do
      @app.url = "http://www.url.com"
      expect{@app.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(@app.errors).to be_added :name, :blank
    end

    it "should not be saved if url is missing" do
      @app.name = "app"
      expect{@app.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(@app.errors).to be_added :url, :blank
    end

    it "should not be saved if name length is less than two" do
      @app.name = "a"
      expect{@app.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not be saved if name is not unique" do
      @app.name = "app"
      @app.url = "http://www.app.com"
      @app.save!
      duplicate_app = Application.new name: "app", url: "http://www.url.com"
      expect{duplicate_app.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(duplicate_app.errors).to be_added :name, :taken
    end

    it "should not be save if url is not unique" do
      @app.name = "app"
      @app.url = "http://www.app.com"
      @app.save!
      duplicate_app = Application.new name: "my app", url: "http://www.app.com"
      expect{duplicate_app.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(duplicate_app.errors).to be_added :url, :taken
    end

    it "should save an app if all input is valid" do
      expect(Application.all.count).to eq 0
      @app.name = "app"
      @app.url = "http://www.app.com"
      @app.save!

      expect(Application.all.count).to eq 1
    end
  end

  describe "Dependencies" do
    it "should not save if it does not belong to a user" do
      app = Application.new name: "app", url: "http://www.url.com"
      expect{app.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(app.errors).to be_added :user, :blank
    end

    it "should be destroyed if its user has been destroyed" do
      user = User.new name: "user", email: "matt@example.com", password: "password"
      user.skip_confirmation!
      user.save!
      app = Application.new name: "app", url: "http://www.url.com", user: user
      app.save!

      expect(Application.all.count).to eq 1

      user.destroy!

      expect(Application.all.count).to eq 0
    end
  end
end