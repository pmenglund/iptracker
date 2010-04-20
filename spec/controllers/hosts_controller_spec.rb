require File.dirname(__FILE__) + '/../spec_helper'
 
describe HostsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Host.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Host.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Host.any_instance.stubs(:valid?).returns(true)
    post :create, :host => {:name => "dummy", :host_type_id => 1}
    response.should redirect_to(host_url(assigns[:host]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Host.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Host.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Host.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Host.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Host.first
    response.should redirect_to(host_url(assigns[:host]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    host = Host.first
    delete :destroy, :id => host
    response.should redirect_to(hosts_url)
    Host.exists?(host.id).should be_false
  end
end
