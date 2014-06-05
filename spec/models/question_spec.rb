# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  up_votes    :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  asker_id    :integer
#  voters      :text
#

require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
