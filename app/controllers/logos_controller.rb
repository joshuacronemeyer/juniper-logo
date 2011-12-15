class LogosController < ApplicationController
  def show
    @logo = Logo.find(params[:id])
    @new_logo = Logo.new(:json => @logo.json)
  end
  
  def index
    @juniper_logo = Logo.find_by_title("Juniper")
    @logos = Logo.random(10) - [@juniper_logo]
  end
  
  def create
    @logo = Logo.create(params[:logo])
    if @logo.errors.empty?
      redirect_to logos_path
    else
      render :show
    end
  end
end
