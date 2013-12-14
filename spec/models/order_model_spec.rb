require 'spec_helper'

describe Order do 

  describe "validations" do

# Association Validations
    it "should have many order items" do
      t = Order.reflect_on_association(:order_items)
      t.macro.should == :has_many
    end
  end
end