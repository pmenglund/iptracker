class VerificationsController < ApplicationController
  def index
    @verifications = Verification.all
  end
  
  def show
    @verification = Verification.find(params[:id])
  end
  
  def destroy
    @verification = Verification.find(params[:id])
    @verification.destroy
    flash[:notice] = "Successfully destroyed verification."
    redirect_to verifications_url
  end
end
