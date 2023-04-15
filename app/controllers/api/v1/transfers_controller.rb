class Api::V1::TransfersController < ApplicationController
    
  def index
    @transfers = Account.find(params[:account_id]).transfers
    render json: {transfers: @transfers}
  end

  def show 

  end

  def create
    @account = Account.find(params[:account_id])
    @recipient_account = Account.find(params[:recipient_account_id])
    @amount = params[:amount]
    @new_transfer = Transfer.create(amount: params[:amount], account_id: @account.id , recipient_account_id: @recipient_account.id)
    if @new_transfer
      if @account.balance.to_i > @amount.to_i
        @account.balance.to_i - @amount.to_i
        @recipient_account.balance += @amount.to_i
        @new_transfer.save
        
        render json: { new_transfer: @new_transfer }
      else
        render json: { error: "This account does not have enough funds to secure this transfer" }, status: :unprocessable_entity
      end
    else
      render json: { error: @new_transfer.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
