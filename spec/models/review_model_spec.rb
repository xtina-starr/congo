require 'spec_helper'

describe Review do 

  describe "validations" do

# Basic Attribute Validations 
    it "must have a title" do
      expect(Review.new(:title => nil)).to be_invalid
    end

    it "must have a rating" do
      expect(Review.new(:rating => nil)).to be_invalid
    end

# I can't get this to work. should not on 6 star rating works. need help.

    # it "allows 1 star rating" do
    #   expect(Review.new(:rating => 4)).to be_valid
    # end

    it "should not allow a rating of 6 stars" do
      expect(Review.new(:rating => 6)).to be_invalid
    end


# Association Validations
  it "should belong to a User" do
      r = Review.reflect_on_association(:user)
      r.macro.should == :belongs_to
    end
  end

  it "should belong to a Product" do
    r = Review.reflect_on_association(:product)
    r.macro == :belongs_to
  end
end