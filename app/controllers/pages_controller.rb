class PagesController < ApplicationController

  def home
    @large_header = true
  end

  def about
    @large_header = true
  end

  def handbook
  end

  def test
  end

  def error
  end

  def tutoring
    @large_header = true
    @tutoring_cost = TutoringSlot::COST
  end

  def tutoring_purchase
    @tutoring_cost = TutoringSlot::COST
    @tutoring_slot = TutoringSlot.create!
    @transaction = Transaction.new(item: @tutoring_slot, user: current_user)

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @tutoring_cost,
      :description => @transaction.id.to_s,
      :currency    => 'usd'
    )

    ActiveRecord::Base.transaction do
      @transaction.amount = @tutoring_cost
      @transaction.stripe_charge_id = charge.id
      @transaction.charged = true
      @transaction.save
    end

    flash[:info] = "You have successfully paid #{@transaction.cost_in_dollars} for tutoring!"
    redirect_to tutoring_path

    rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to tutoring_path

  end

  def student
    @large_header = true
  end

  def question_answer
    @large_header = true
    @question = Question.new
  end

end
