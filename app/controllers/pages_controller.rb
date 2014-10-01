class PagesController < ApplicationController
  include ApplicationHelper

  def home
    @profile_needs_info = true
    @home = get_yaml_data_file("home.yml")
    @company_logos = get_yaml_data_file("company_logos.yml")
  end

  def about
    @large_header = true
    @about = get_yaml_data_file("about.yml")
  end

  def handbook
    @handbook = get_yaml_data_file("handbook.yml")
  end

  def test
  end

  def error
  end

  def tutoring
    @large_header = true
    @tutoring_cost = TutoringSlot::COST
    @profile_needs_info = true
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
    @profile_needs_info = true
  end

  def question_answer
    @large_header = true
    @question = Question.new
    @top_questions = Question.top(7)
    @questions = Question.not_including_top(7)
  end

  def question_guidelines
    @large_header = true
  end

  def how_this_works
    @large_header = true
  end

  def how_it_works
    @home = get_yaml_data_file("home.yml")
  end

  def employer_faq
  end

end
