class Slide < ActiveRecord::Base
  belongs_to :parent, polymorphic: true
end
