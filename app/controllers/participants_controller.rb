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

    @participant = current_user.participants.last
    @participant.update(:status => true)

  end

  def decline
    @participant = current_user.participants.last
    @participant.update(:status => false)
  end
end

