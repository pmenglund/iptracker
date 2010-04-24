# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class CidrsController < ApplicationController
  def index
    @cidrs = Cidr.all(:order => 'position')
  end
  
  def show
    @cidr = Cidr.find(params[:id], :include => :ip_addresses)
  end
  
  def new
    @cidr = Cidr.new
  end
  
  def create
    @cidr = Cidr.new(params[:cidr])
    if @cidr.save
      flash[:notice] = "Successfully created cidr."
      redirect_to @cidr
    else
      render :action => 'new'
    end
  end
  
  def edit
    @cidr = Cidr.find(params[:id])
  end
  
  def update
    @cidr = Cidr.find(params[:id])
    if @cidr.update_attributes(params[:cidr])
      flash[:notice] = "Successfully updated cidr."
      redirect_to @cidr
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @cidr = Cidr.find(params[:id])
    @cidr.destroy
    flash[:notice] = "Successfully destroyed cidr."
    redirect_to cidrs_url
  end
  
  def verify
    @cidr = Cidr.find(params[:id])
    @cidr.ip_addresses.each do |ip|
      ip.send_later(:verify) if ip.usable?
    end
    flash[:notice] = "Verification started..."
    redirect_to @cidr
  end
  
  def reorder
    @cidr = Cidr.find(params[:id])
    direction = params[:direction] == 'up' ? -1 : 1
    @cidr.position += direction
    @cidr.save
    @cidrs = Cidr.all(:order => 'position')
    render @cidrs
  end
end
