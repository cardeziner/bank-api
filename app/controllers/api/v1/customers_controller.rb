class Api::V1::CustomersController < ApplicationController
    
  def index
    @customers = Customer.all
    render json: { customers: @customers}
  end

  def show 
    @customer = Customer.find(params[:id])
    render json: { customer: @customer } 
  end
   
end
