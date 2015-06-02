class WelcomeController < ApplicationController
  def about
  end

  def index
    redirect_to applications_path if current_user
  end
end
