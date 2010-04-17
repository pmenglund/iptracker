require File.dirname(__FILE__) + '/../spec_helper'
 
describe CidrsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Cidr.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Cidr.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    # TODO: fix this
    # Cidr.any_instance.stubs(:valid?).returns(true)
    # post :create, :cidr => {:cidr => '1.2.3.4/5', :name => 'dummy'}
    # response.should redirect_to(cidr_url(assigns[:cidr]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Cidr.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Cidr.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cidr.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Cidr.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cidr.first
    response.should redirect_to(cidr_url(assigns[:cidr]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    cidr = Cidr.first
    delete :destroy, :id => cidr
    response.should redirect_to(cidrs_url)
    Cidr.exists?(cidr.id).should be_false
  end
  
  it "verify action should redirect to show" do
    cidr = Cidr.first
    get :verify, :id => cidr
    response.should redirect_to(cidr_url(cidr))
  end
end
