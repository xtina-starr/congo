require 'spec_helper'

describe User do 

  describe "validations" do
    it "must have a name" do
      expect(User.new(:name => nil)).to be_invalid
    end

    it "must have an email" do
      expect(User.new(:email => nil)).to be_invalid
    end

    it "with a nil body had an error message" do
      post = Post.new
      post.valid?
      expect(post.errors[:Body]).to include "Can't be blank"
    end

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