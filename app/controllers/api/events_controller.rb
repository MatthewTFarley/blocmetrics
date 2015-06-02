class API::EventsController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    registered_application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    return render json: "Unregistered application", status: :unprocessable_entity if registered_application.blank?

    @event = Event.new(event_params)
    @event.application = registered_application

    if @event.save
      render json: @event, status: :created
    else
      render @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
