class LoansController < ApplicationController 
  before_action :set_loan, only: [:show, :update, :destroy] 

  def index 
    @loans = Loan.all 
    render json: @loans 
  end

  def create 
    @loan = Loan.new(loan_params) 
    if @loan.save 
      render json: { success: true, loan_id: @loan.id } 
    else 
      render json: { success: false } 
    end 
  end 

  def update 
    if @loan.update(loan_params) 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  def show 
    render json: @loan
  end 

  def destroy 
    if @loan.destroy 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  private

  def set_loan
    @loan = Loan.find(params[:id]) 
  end 
  def loan_params 
    params.permit(:user_id, :amount, :installment_amount, :payment_date) 
  end 
end