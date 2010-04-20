require File.dirname(__FILE__) + '/../spec_helper'

describe Host do
  it "should be valid" do
    Host.new(:name => "dummy", :host_type_id => 1).should be_valid
  end
end
