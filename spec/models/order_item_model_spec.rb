require 'spec_helper'

describe OrderItem do

  describe "OrderItem" do
    it "must belong to a product" do
      expect(OrderItem.new(:product_id => nil)).to be_invalid
    end
  
    it "must belong to an order" do
      expect(OrderItem.new(:order => nil)).to be_invalid
    end

    it "must have a quantity" do
      expect(OrderItem.new(:quantity => nil)).to be_invalid
    end
  end
end