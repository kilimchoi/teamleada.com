class ChargesController < ApplicationController

  def new
    @project = Project.find_by(url: params[:project_url])
  end

  def create
    @project = Project.find_by(url: params[:project_url])
    @transaction = Transaction.new(item: @project, user: current_user)

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
      @transaction.save
    end

    flash[:info] = "You have successfully paid $#{@project.cost_in_dollars} for the #{@project.title} project!"
    redirect_to project_path(url: @project.url)

    rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to projects_path
  end

  private

  def transaction_params
  end

end
