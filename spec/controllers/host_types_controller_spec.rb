require File.dirname(__FILE__) + '/../spec_helper'
 
describe HostTypesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => HostType.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    HostType.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    HostType.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(host_type_url(assigns[:host_type]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => HostType.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    HostType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => HostType.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    HostType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => HostType.first
    response.should redirect_to(host_type_url(assigns[:host_type]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    host_type = HostType.first
    delete :destroy, :id => host_type
    response.should redirect_to(host_types_url)
    HostType.exists?(host_type.id).should be_false
  end
end
