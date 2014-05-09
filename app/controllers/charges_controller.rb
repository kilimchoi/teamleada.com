class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500
    @transaction = Transaction.find(params[:transaction_id])

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @transaction.id.to_s,
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to charges_path
  end

end
