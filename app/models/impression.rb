class Impression < ActiveRecord::Base

  def model
    impressionable_type.constantize
  end

end
