class Feature < ActiveRecord::Base

  class << self

    def enabled?(name)
      find_by(name: name).enabled?
    end

  end

end
