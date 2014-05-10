class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :index, :show, to: :view

    if user.is_admin?
      can :manage, :all
    elsif user.is_company?
      can :dashboard
    elsif !user.new_record?
      can :show, User, id: user.id
      can :read, Project, paid: false
      can :read, Project, Project.costs_money do |project|
        !user.transactions.find_by(item: project).nil?
      end
    end
  end

end
