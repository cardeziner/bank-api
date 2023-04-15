class Api::V1::AccountsController < ApplicationController

  def index
    @accounts = Account.first
    render json: { accounts: @accounts }
  end

  def show 
    @account_info = Account.find(params[:id])
    render json: { account: @account_info }
  end

  def create
    @new_account = Account.create(name: params[:name])
    @initial_deposit = Deposit.create(amount: params[:amount], id: @new_account.id)
    if @new_account 
      if @initial_deposit > 0
        @new_account.save
        @initial_deposit.save
        @new_account.balance += @inital_deposit.amount
        render json: { account_info: @newaccount, balance: @new_account.balance }
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
