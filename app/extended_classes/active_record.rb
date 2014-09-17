class ActiveRecord::Base

  class << self

    def second
      first(2).last
    end

    def updated_last
      unscoped.order("updated_at DESC").first
    end

  end

end
