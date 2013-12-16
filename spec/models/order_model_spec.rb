require 'spec_helper'

describe Order do

  describe "Order" do
    it "must have one or more Order Items" do
      t = Order.reflect_on_association(:order_items)
      t.macro.should == :has_many
    end
  end
end
