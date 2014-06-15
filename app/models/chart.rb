# == Schema Information
#
# Table name: charts
#
#  category     :string(255)
#  title        :string(255)
#  y_axis_label :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  uid          :integer          not null, primary key
#

class Chart < ActiveRecord::Base
  self.primary_key = "uid"

  has_many :chart_metrics
  has_many :metrics, through: :chart_metrics

  CATEGORIES = ["users", "projects"]
end
