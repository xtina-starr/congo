require 'spec_helper'

describe Review do 

  describe "validations" do

# Basic Attribute Validations 
    it "must have a rating" do
      expect(Review.new(:rating => nil)).to be_invalid
    end
  end
end