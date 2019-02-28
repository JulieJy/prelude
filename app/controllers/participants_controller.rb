class ParticipantsController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def destroy
  end

  def accept
    @participant = Participant.find(params[:id])
    @participant.update(:status => true)
    @event = @participant.event
  end

  def decline
    @participant = Participant.find(params[:id])
    @participant.update(:status => false)
    @event = @participant.event
  end
end

