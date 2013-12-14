require 'spec_helper'

describe OrderItem do 

  describe "validations" do

# Basic Attribute Validations 
    it "must have a quantity" do
      expect(OrderItem.new(:quantity => nil)).to be_invalid
    end
  end
end