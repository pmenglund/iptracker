require File.dirname(__FILE__) + '/../spec_helper'

describe IpAddress do
  it "should be valid" do
    IpAddress.new.should be_valid
  end
end
