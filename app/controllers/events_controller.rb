class EventsController < ApplicationController

  def show

    @event = Event.find(params[:id])
    @participant = @event.participants.where(user: current_user).first

    ap @event
    ap @event.creator

    @markers = [{
      lng: @event.coordinates[:longitude],
      lat: @event.coordinates[:latitude],
      image_url: helpers.asset_url('https://i.imgur.com/BsUZoRX.png')
    }]

    ap @markers
  end

  def new
    @event = Event.new(date: Date.current, time: '19:00')
    @bars = Bar.all

  end

  def create
    @event = Event.new(event_params)
    @user = User.find_by(email: params[:event][:invitation_emails])
    participants = params[:event][:invitation_emails].reject(&:empty?)
    # @user.role = organizer
    if @event.save
      Participant.create!(event: @event, user: current_user, role: 'organizer', status: true)
      participants.each do |participant|
        user = User.find_by(email: participant)
        Participant.create!(event: @event, user: user, role: 'attendee')
      end
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
