# == Schema Information
#
# Table name: slides
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  parent_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  parent_type :string(255)
#

class Slide < ActiveRecord::Base
  serialize :content, Array
  belongs_to :parent, polymorphic: true

  default_scope order('id')
end
