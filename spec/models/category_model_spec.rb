require 'spec_helper'

describe Category do 
    
  describe "validations" do    
# Basic Attribute Validations 
    it "must have a name" do
      expect(Category.new(:name => nil)).to be_invalid
    end

# Tests uniqueness of name, but doesn't dynamically come up with testing name
    it "has a unique name" do
      cat_one = Category.new(:name => 'Fancy Whipped Egg Cookies')
      cat_two = Category.new(:name => 'Fancy Whipped Egg Cookies')
      cat_one.name != cat_two.name
    end

# Association Validations
    it "should have many products" do
      cat = Category.reflect_on_association(:products)
      cat.macro.should == :has_many
    end
  end
end