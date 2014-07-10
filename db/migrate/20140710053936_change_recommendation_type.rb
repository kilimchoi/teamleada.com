class ChangeRecommendationType < ActiveRecord::Migration
  def change
    rename_column :job_recommendations, :type, :recommendation_type
  end
end
