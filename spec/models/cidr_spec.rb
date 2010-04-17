require File.dirname(__FILE__) + '/../spec_helper'

describe Cidr do
  it "should be valid" do
    Cidr.new.should be_valid
  end
end
