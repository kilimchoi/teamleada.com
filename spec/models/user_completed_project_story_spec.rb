# == Schema Information
#
# Table name: stories
#
#  id            :integer          not null, primary key
#  interactor_id :integer
#  interactee_id :integer
#  company_id    :integer
#  text          :text
#  created_at    :datetime
#  updated_at    :datetime
#  type          :string(255)
#  favorite      :boolean          default(TRUE)
#

require 'spec_helper'

describe UserCompletedProjectStory do
  pending "add some examples to (or delete) #{__FILE__}"
end
