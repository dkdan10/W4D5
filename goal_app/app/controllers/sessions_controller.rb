class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], paramas[:user][:password])

    if user
      login!(user)
      redirect_to goals_url
    else
      flash.now[:errors] = ['INVALID']
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end