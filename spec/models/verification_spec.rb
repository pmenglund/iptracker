require File.dirname(__FILE__) + '/../spec_helper'

describe Verification do
  it "should be valid" do
    Verification.new.should be_valid
  end
end
