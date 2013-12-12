require 'spec_helper'

describe User do 

  describe "validations" do
    it "must have a name" do
      expect(User.new(:name => nil)).to be_invalid
    end

    it "must have an email" do
      expect(User.new(:email => nil)).to be_invalid
    end
  end
end