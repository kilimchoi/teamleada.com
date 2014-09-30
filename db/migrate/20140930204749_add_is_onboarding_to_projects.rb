class AddIsOnboardingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_onboarding, :boolean, default: false
  end
end
