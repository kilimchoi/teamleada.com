# == Schema Information
#
# Table name: job_experiences
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  summary    :text
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#  job_id     :integer
#

require 'spec_helper'

describe JobExperience do
  pending "add some examples to (or delete) #{__FILE__}"
end
