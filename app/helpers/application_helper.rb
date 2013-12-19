module ApplicationHelper

  def signed_in?
    STDERR.puts "cookies[:user_id] = #{cookies[:user_id]}"
    if cookies[:user_id] != nil
      STDERR.puts "User's database token    =  #{User.find(cookies[:user_id].to_i).remember_token}"
      STDERR.puts "cookies[:remember_token] = #{cookies[:remember_token]}"
    end
    cookies[:user_id] != nil && User.find(cookies[:user_id].to_i).remember_token == cookies[:remember_token]
  end

  def current_user
    User.find(cookies[:user_id])
  end


  # User signs in, a cookie gets placed for the long term.
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    cookies.permanent[:user_id] = user.id
    STDERR.puts "sign_in:"
    STDERR.puts "New cookie: user_id=#{user.id}"
    STDERR.puts "New cookie: remember_token=#{remember_token}"
    user.update_attribute(:remember_token, remember_token)
  end
end
