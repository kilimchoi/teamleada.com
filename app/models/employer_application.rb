class EmployerApplication < ActiveRecord::Base

  validates_presence_of :name, :email, :size, :description
  validate :industry_or_other

  private

  def industry_or_other
    if industry.blank? && custom_industry.blank?
      errors.add(:base, "You must select an industry, or select 'Other' and enter in the field below.")
    end
  end

end
