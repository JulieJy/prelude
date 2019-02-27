class EventsController < ApplicationController

  def show

    @event = Event.find(params[:id])

    @markers = [{
      lng: @event.coordinates[:longitude],
      lat: @event.coordinates[:latitude],
      image_url: helpers.asset_url('https://cdn2.iconfinder.com/data/icons/flat-ui-icons-24-px/24/location-24-512.png')
    }]
  end

  def new
    @event = Event.new
    @bars = Bar.all

  end

  def create
    @event = Event.new(event_params)
    # @user = User.find(params[:user_id])
    # @user.role = organizer

    if @event.save
      Participant.create!(event: @event, user: current_user, role: 'organizer')
      redirect_to event_path(@event)
    else
      @bars = Bar.all
      render :new
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :place, :nb_person, :bar_id)
  end


end
