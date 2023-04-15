class Api::V1::AccountsController < ApplicationController
 
  def index
    @accounts = Customer.find(params[:customer_id]).accounts
    render json: { accounts: @accounts }
  end

  def show 
    @account_info = Account.find(params[:id])
    render json: { account_info: @account_info }
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @new_account = Account.create(customer_id: @customer.id, balance: params[:amount])
    @initial_deposit = Deposit.create(amount: params[:amount], id: @new_account.id)
    if @new_account 
      if @initial_deposit.amount > 0
        @new_account.save
        @initial_deposit.save

        render json: { account_info: @new_account, balance: @new_account.balance }
      else 
        render json: { error: "No deposit has been provided by new customer" }
      end
    else
      render json: { error: @new_account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    
  end

  def destroy

  end

end
