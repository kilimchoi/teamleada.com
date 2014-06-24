# == Schema Information
#
# Table name: days
#
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#  date       :date
#

class Day < ActiveRecord::Base
  self.primary_key = "uid"
  has_many :metric_entries

  before_create :set_uid

  default_scope { order(:uid) }

  def set_uid
    self.uid = self.date.to_date.to_time.to_i
  end

  def pretty_date
    date.strftime("%B %d")
  end

end
