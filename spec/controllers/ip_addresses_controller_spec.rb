require File.dirname(__FILE__) + '/../spec_helper'
 
describe IpAddressesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => IpAddress.first
    response.should render_template(:show)
  end
  
  it "new action should not exist" do
    lambda {
      get :new
    }.should raise_error(ActionController::UnknownAction)
  end
  
  it "create action should not_exist" do
    lambda {
      IpAddress.any_instance.stubs(:valid?).returns(false)
      post :create
    }.should raise_error(ActionController::UnknownAction)
  end
    
  it "edit action should render edit template" do
    get :edit, :id => IpAddress.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    IpAddress.any_instance.stubs(:valid?).returns(false)
    put :update, :id => IpAddress.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    IpAddress.any_instance.stubs(:valid?).returns(true)
    put :update, :id => IpAddress.first
    response.should redirect_to(ip_address_url(assigns[:ip_address]))
  end
  
  it "destroy action should not exist" do
    lambda {
      ip_address = IpAddress.first
      delete :destroy, :id => ip_address
    }.should raise_error(ActionController::UnknownAction)
  end
end
