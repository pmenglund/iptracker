# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class IpAddressesController < ApplicationController
  def index
    @ip_addresses = IpAddress.paginate :page => params[:page], :order => 'ip_hex', :include => 'cidr'
  end
  
  def show
    @ip_address = IpAddress.find(params[:id])
  end
  
  def new
    @ip_address = IpAddress.new
  end
  
  def create
    @ip_address = IpAddress.new(params[:ip_address])
    if @ip_address.save
      flash[:notice] = "Successfully created ip address."
      redirect_to @ip_address
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ip_address = IpAddress.find(params[:id])
  end
  
  def update
    @ip_address = IpAddress.find(params[:id])
    if @ip_address.update_attributes(params[:ip_address])
      flash[:notice] = "Successfully updated ip address."
      redirect_to @ip_address
    else
      render :action => 'edit'
    end
  end
  
end
