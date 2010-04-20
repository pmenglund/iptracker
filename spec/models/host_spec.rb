require File.dirname(__FILE__) + '/../spec_helper'

describe Host do
  it "should be valid" do
    Host.new.should be_valid
  end
end
