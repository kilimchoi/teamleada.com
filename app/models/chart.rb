class Chart < ActiveRecord::Base
  self.primary_key = "uid"

  CATEGORIES = ["users"]
end
