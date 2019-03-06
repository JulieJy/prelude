class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      render "home_authenticate.html.erb"
    else
      render "home_unauthenticate.html.erb"
    end
  end
end
