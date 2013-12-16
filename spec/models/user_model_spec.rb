require 'spec_helper'

describe User do 

  describe "validations" do

# Basic Attribute Validations 
    it "must have a name" do
      expect(User.new(:name => nil)).to be_invalid
    end

    it "must have an email" do
      expect(User.new(:email => nil)).to be_invalid
    end

# User authentication should take care of password validation automatically. But rspec could be written. SS

    # it "must have an password" do
    #   expect(User.new(:password => nil)).to be_invalid
    # end

    # it "must have an password confirmation" do
    #   expect(User.new(:password_confirmation => nil)).to be_invalid
    # end


# Association Validations
    it "should have many products" do
      t = User.reflect_on_association(:products)
      t.macro.should == :has_many
    end

    it "should have many orders" do
      t = User.reflect_on_association(:orders)
      t.macro.should == :has_many
    end
  end
end