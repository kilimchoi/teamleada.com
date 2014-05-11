# == Schema Information
#
# Table name: employer_applications
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  size            :string(255)
#  industry        :string(255)
#  custom_industry :string(255)
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe EmployerApplication do
  pending "add some examples to (or delete) #{__FILE__}"
end
