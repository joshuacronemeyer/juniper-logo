class LogosController < ApplicationController
  def show
    @logo = Logo.find(params[:id])
  end
  
  def index
    @juniper_logo = Logo.find_by_title("Juniper")
    @logos = Logo.random(10) - [@juniper_logo]
  end
  
end
