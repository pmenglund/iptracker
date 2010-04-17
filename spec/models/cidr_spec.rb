require File.dirname(__FILE__) + '/../spec_helper'

describe Cidr do
  it "should be valid" do
    Cidr.new(:cidr => '1.2.3.4/5', :name => 'dummy').should be_valid
  end

  it "should be invalid when the cidr is invalid" do
    Cidr.new(:cidr => '1.2.3.4', :name => 'dummy').should_not be_valid
  end
  
  it "should be invalid when the cidr is invalid" do
    Cidr.new(:cidr => '1.2.3.4/56', :name => 'dummy').should_not be_valid
  end
  
  it "should create ip_addresses when created"
  
end
