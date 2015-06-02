class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  def index
    @applications = Application.where(user_id: current_user)
  end

  def show
    @event_names = @application.events.pluck(:name)
  end

  def new
    @application = current_user.applications.build
  end

  def create
    @application = current_user.applications.build(application_params)
    if @application.save
      redirect_to @application, notice: "Your application has been successfully added."
    else
      flash[:error] = "There was a problem adding your application. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @application.update(application_params)
      redirect_to @application, notice: "Your application has been successfully updated."
    else
      flash[:error] = "Ther was a problem updating your application. Please try again."
      render 'edit'
    end
  end

  def destroy
    @application.destroy
    redirect_to applications_path, notice: "Your application has been successfully removed."
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :url)
  end
end
