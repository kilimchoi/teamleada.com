# == Schema Information
#
# Table name: employer_applications
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  size            :string(255)
#  industry        :string(255)
#  custom_industry :string(255)
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#

class EmployerApplication < ActiveRecord::Base

  validates_presence_of :name, :email, :size, :description
  validate :industry_or_other

  INDUSTRY_OPTIONS = ['Agriculture, Forestry, Fishing', 'Mining', 'Construction', 'Manufacturing', 'Transportation',
                      'Wholesale Trade', 'Retail Trade', 'Finance', 'Services', 'Public Administration', 'Other']

  SIZE_OPTIONS = ['1-5', '5-10', '10-25', '25-50', '50-100', '100-500', '500-1000', '1000+']

  private

  def industry_or_other
    if industry.blank? && custom_industry.blank?
      errors.add(:base, "You must select an industry, or select 'Other' and enter in the field below.")
    end
  end

end
