class LibrariesController < ApplicationController
  def index
  end

  def delete
  end

  def create
    @library = Library.new(library_params)
    @user = current_user
    @library.user = @user

    if @library.save!
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private

  def library_params
    params.require(:library).permit(:game_id)
  end

end
