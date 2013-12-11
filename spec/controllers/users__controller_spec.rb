require 'spec_helper'

describe UsersController do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      response.should be_successful
    end
  end
end


  # describe "GET show" do
  #   it "assigns the requested user to @user" 
  #   get :show, id: user

  # end


  # it "populates an array of users" do
  #     user = FactoryGirl.create(:user)
  #     get :index
  #     assigns(:users).should eq([user])
  #   end