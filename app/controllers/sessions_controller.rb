class SessionsController < ApplicationController
  include ApplicationHelper


  def new
    if signed_in?
      redirect_to root_path
    else
      render 'new'
    end
  end

  def create
      @current_user = User.find_by(email: params[:email].downcase)
      if @current_user && User.authenticate(params[:email], params[:password])
        sign_in(@current_user)
        # redirect to the browse view.
        redirect_to users_path
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
  end

  def destroy
    @current_user = nil
    cookies.delete(:remember_token)
    redirect_to '/users'
  end
end
