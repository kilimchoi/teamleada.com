class Feature < ActiveRecord::Base

  class << self

    def enabled?(name)
      find_by(name: name).try(:enabled?)
    end

  end

end
