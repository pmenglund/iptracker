# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class HostsController < ApplicationController
  def index
    @hosts = Host.all
  end
  
  def show
    @host = Host.find(params[:id], :include => :assignments)
  end
  
  def new
    @host = Host.new
  end
  
  def create
    @host = Host.new(params[:host])
    if @host.save
      flash[:notice] = "Successfully created host."
      redirect_to @host
    else
      render :action => 'new'
    end
  end
  
  def edit
    @host = Host.find(params[:id], :include => :assignments)
  end
  
  def update
    @host = Host.find(params[:id])
    if @host.update_attributes(params[:host])
      flash[:notice] = "Successfully updated host."
      redirect_to @host
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    flash[:notice] = "Successfully destroyed host."
    redirect_to hosts_url
  end
end
