class CidrsController < ApplicationController
  def index
    @cidrs = Cidr.all
  end
  
  def show
    @cidr = Cidr.find(params[:id])
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
end
