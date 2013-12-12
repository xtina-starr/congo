class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_filter :create_remember_token, :only => :create_remember_token
  
  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)

    respond_to do |format|
      if @users.save
        format.html { redirect_to @users, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @users.update(user_params)
        format.html { redirect_to @users, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @users.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Encrypt using SHA1, faster than Bcrypt. Important because it will
  # run on every page.
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end


