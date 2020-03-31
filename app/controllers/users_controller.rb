class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find params[:id]
    @tracked_stocks = @user.stocks
  end
  
  def search
    friend = params[:friend]
    if friend.present?
      @friends = User.search friend
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Cannot find any user eith that name..."
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a name or email to search"
        format.js { render partial: 'users/result' }
      end
    end
  end
end
