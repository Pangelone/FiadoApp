class PaymentsController < ApplicationController 
  before_action :set_payment, only: [:show, :update, :destroy] 

  def index 
    @payments = Payment.all 
    render json: @payments 
  end

  def create 
    @payment = Payment.new(payment_params) 
    if @payment.save 
      render json: { success: true, payment_id: @payment.id } 
    else 
      render json: { success: false } 
    end 
  end 

  def update 
    if @payment.update(payment_params) 
      if @payment.overdue?
        render json: { success: true, notification: "El pago se ejecuto con un 5% de recargo."} 
      else
        render json: { success: true, notification: 'El pago se ejecuto sin cargos extras.'} 
      end
    else 
      render json: { success: false } 
    end 
  end 

  def show 
    render json: @payment 
  end 

  def destroy 
    if @payment.destroy 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  private

  def set_payment
    @payment = Payment.find(params[:id]) 
  end 

  def payment_params 
    params.permit(:loan_id, :user_id, :payment_amount, :date) 
  end 
end