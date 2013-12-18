module ApplicationHelper

  def signed_in?
    cookies[:user_id] != nil && User.find(cookies[:user_id].to_i).remember_token == cookies[:remember_token]
  end


  # User signs in, a cookie gets placed for the long term.
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    cookies.permanent[:user_id] = user.id
    user.update_attribute(:remember_token, remember_token)
  end
end
