require File.dirname(__FILE__) + '/../spec_helper'

describe IpAddress do
  it "should be valid" do
    IpAddress.new(:cidr_id => 1, :ip_address => '1.2.3.4').should be_valid
  end
  
  it "should be invalid when ip address is invalid" do
    IpAddress.new(:cidr_id => 1, :ip_address => '1.2.3').should_not be_valid
  end
  
  it "should compute a hex value of the ip address" do
    ip = IpAddress.new(:cidr_id => 1, :ip_address => '1.1.1.1')
    ip.save!
    ip.ip_hex.should == 256*256*256 + 256*256 + 256 + 1
  end
  
end
