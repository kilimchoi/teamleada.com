class Chart < ActiveRecord::Base
  self.primary_key = "uid"

  has_many :chart_metrics
  has_many :metrics, through: :chart_metrics

  CATEGORIES = ["users"]
end
