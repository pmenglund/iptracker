require File.dirname(__FILE__) + '/../spec_helper'

describe HostType do
  it "should be valid" do
    HostType.new.should be_valid
  end
end
