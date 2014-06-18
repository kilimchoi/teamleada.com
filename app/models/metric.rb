# == Schema Information
#
# Table name: metrics
#
#  model      :string(255)
#  title      :string(255)
#  method     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :integer          not null, primary key
#

class Metric < ActiveRecord::Base
  self.primary_key = "uid"

  has_many :chart_metrics
  has_many :charts, through: :chart_metrics

  has_many :metric_entries
  has_many :days, through: :metric_entries

  def backfill_to_today(start_date)
    backfill_range(start_date, Date.today)
  end

  def backfill_range(start_date, end_date)
    (start_date.to_date..end_date.to_date).each do |date|
      day = Day.where(date: date.to_date).first_or_create
      backfill_day(day)
    end
  end

  def backfill_today
    backfill_day(Day.where(date: Date.today.to_date).first_or_create)
  end

  def backfill_day(day)
    metric_entry = MetricEntry.where(day: day, metric: self).first_or_create
    metric_entry.value = self.send(collection_method, day)
    metric_entry.save
  end

  def model_class
    model.constantize
  end

  # Collection Methods
  def get_filter(day)
    model_class.all.select{ |object| object.send(method, day) }
  end

  def get_map(day)
    model_class.all.collect{ |object| object.send(method, day) }
  end

  def get_count(day)
    get_filter(day).count
  end

  def get_sum(day)
    get_map(day).sum
  end

end
