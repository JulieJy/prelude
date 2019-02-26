class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    # @user = User.find(params[:user_id])
    # @user.role = organizer

    if @event.save
      Participant.create!(event: @event, user: current_user, role: 'organizer')
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :place, :nb_person)
  end

end
