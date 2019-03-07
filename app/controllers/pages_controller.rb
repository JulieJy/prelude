class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      @my_event = current_user.creator_events.order(date: :desc).limit(3)
      @invitations = current_user.attendee_events.order(date: :desc).limit(3)
      render "home_authenticate.html.erb"
    else
      render "home_unauthenticate.html.erb"
    end
  end
end
