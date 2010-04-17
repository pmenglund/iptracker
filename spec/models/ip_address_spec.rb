require File.dirname(__FILE__) + '/../spec_helper'

describe IpAddress do
  it "should be valid" do
    IpAddress.new(:cidr_id => 1, :ip_address => '1.2.3.4').should be_valid
  end
end
