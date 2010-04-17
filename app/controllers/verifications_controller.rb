class VerificationsController < ApplicationController
  def index
    @verifications = Verification.all
  end
  
  def show
    @verification = Verification.find(params[:id])
  end
  
  def new
    @verification = Verification.new
  end
  
  def create
    @verification = Verification.new(params[:verification])
    if @verification.save
      flash[:notice] = "Successfully created verification."
      redirect_to @verification
    else
      render :action => 'new'
    end
  end
  
  def edit
    @verification = Verification.find(params[:id])
  end
  
  def update
    @verification = Verification.find(params[:id])
    if @verification.update_attributes(params[:verification])
      flash[:notice] = "Successfully updated verification."
      redirect_to @verification
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @verification = Verification.find(params[:id])
    @verification.destroy
    flash[:notice] = "Successfully destroyed verification."
    redirect_to verifications_url
  end
end
