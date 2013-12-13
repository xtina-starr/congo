class SessionsController < ApplicationController

  def new
    render 'new'
  end

  # store the token in a cookie
  session[:remember_token] = user.id
  # use the cookie
  # User.find(session[:remember_token])  gets current user object

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       session[:remember_token] = user.id
       # redirect here
      # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
