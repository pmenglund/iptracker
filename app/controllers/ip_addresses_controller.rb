# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class IpAddressesController < ApplicationController
  def index
    @ip_addresses = IpAddress.paginate :page => params[:page], :order => 'ip_hex', :include => [:cidr, :latest_verification]
  end
  
  def show
    @ip_address = IpAddress.find(params[:id], :include => [:cidr, :verifications])
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

  def verify
    @ip_address = IpAddress.find(params[:id])
    @ip_address.send_later(:verify)
    flash[:notice] = "Verification in progress..."
    redirect_to @ip_address
  end
end
