# == Schema Information
#
# Table name: projects
#
#  title             :string(255)
#  description       :text
#  created_at        :datetime
#  updated_at        :datetime
#  url               :string(255)
#  enabled           :boolean
#  number            :integer
#  has_leaderboard   :boolean          default(FALSE)
#  short_description :text
#  has_submit        :boolean          default(FALSE)
#  cost              :integer
#  paid              :boolean          default(FALSE)
#  uid               :integer          not null, primary key
#

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
