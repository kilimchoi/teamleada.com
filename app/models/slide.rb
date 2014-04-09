class Slide < ActiveRecord::Base
  serialize :content, Array
  belongs_to :parent, polymorphic: true
end
