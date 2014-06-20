# == Schema Information
#
# Table name: metrics
#
#  model             :string(255)
#  title             :string(255)
#  method            :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  uid               :integer          not null, primary key
#  collection_method :string(255)
#

require 'spec_helper'

describe Metric do
  pending "add some examples to (or delete) #{__FILE__}"
end
