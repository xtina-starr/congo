class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
      user = User.find_by(email: params[:email].downcase)
      if user && User.authenticate(params[:email], params[:password])
        # store the token in a cookie
        session[:remember_token] = user.id
        # redirect here
        # Sign the user in and redirect to the user's show page.
        redirect_to users_path
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end
end
