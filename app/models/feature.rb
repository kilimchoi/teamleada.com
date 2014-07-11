# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  enabled    :boolean
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Feature < ActiveRecord::Base

  class << self

    def enabled?(name)
      find_by(name: name).try(:enabled?)
    end

  end

end
