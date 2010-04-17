require File.dirname(__FILE__) + '/../spec_helper'
 
describe VerificationsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Verification.first
    response.should render_template(:show)
  end
  
  it "new action should not exist" do
    lambda {
      get :new
      }.should raise_error(ActionController::UnknownAction)
  end
  
  it "create action should not exist" do
    lambda {
      Verification.any_instance.stubs(:valid?).returns(false)
      post :create
    }.should raise_error(ActionController::UnknownAction)
  end
    
  it "edit action should not exist" do
    lambda {
      get :edit, :id => Verification.first
    }.should raise_error(ActionController::UnknownAction)
  end
  
  it "update action should not exist" do
    lambda {
      Verification.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Verification.first
    }.should raise_error(ActionController::UnknownAction)
  end
    
  it "destroy action should destroy model and redirect to index action" do
    verification = Verification.first
    delete :destroy, :id => verification
    response.should redirect_to(verifications_url)
    Verification.exists?(verification.id).should be_false
  end
end
