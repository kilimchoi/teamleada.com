class ChargesController < ApplicationController

  def new
    @project = Project.find_by(url: params[:project_url])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @project = Project.find_by(url: params[:project_url])

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @project.cost,
      :description => @transaction.id.to_s,
      :currency    => 'usd'
    )

    ActiveRecord::Base.transaction do
      @transaction.amount = @project.cost
      @transaction.stripe_charge_id = charge.id
      @transaction.charged = true
    end

    rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to charges_path
  end

  private

  def transaction_params
    params.require(:transaction).permit()
  end

end
