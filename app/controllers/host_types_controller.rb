class HostTypesController < ApplicationController
  def index
    @host_types = HostType.all
  end
  
  def show
    @host_type = HostType.find(params[:id])
  end
  
  def new
    @host_type = HostType.new
  end
  
  def create
    @host_type = HostType.new(params[:host_type])
    if @host_type.save
      flash[:notice] = "Successfully created host type."
      redirect_to @host_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @host_type = HostType.find(params[:id])
  end
  
  def update
    @host_type = HostType.find(params[:id])
    if @host_type.update_attributes(params[:host_type])
      flash[:notice] = "Successfully updated host type."
      redirect_to @host_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @host_type = HostType.find(params[:id])
    @host_type.destroy
    flash[:notice] = "Successfully destroyed host type."
    redirect_to host_types_url
  end
end
