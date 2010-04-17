require File.dirname(__FILE__) + '/../spec_helper'

describe Cidr do
  it "should be valid" do
    Cidr.new(:cidr => '1.2.3.4/5', :name => 'dummy').should be_valid
  end
end
