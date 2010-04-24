# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class IpAddressesController < ApplicationController
  
  # TODO: this is not DRY
  def index
    if params[:cidr_id]
      if request.xhr?
        @ip_addresses = IpAddress.find :all, :order => 'ip_hex', :include => [:cidr, :latest_verification], :conditions => {:cidr_id => params[:cidr_id]}
      else
        @ip_addresses = IpAddress.paginate :page => params[:page], :order => 'ip_hex', :include => [:cidr, :latest_verification], :conditions => {:cidr_id => params[:cidr_id]}
      end
    elsif params[:host_id]
      host = Host.find(params[:host_id])
      @ip_addresses = host.ip_addresses      
    else
      @ip_addresses = IpAddress.paginate :page => params[:page], :order => 'ip_hex', :include => [:cidr, :latest_verification]
    end
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
