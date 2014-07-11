# == Schema Information
#
# Table name: publications
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  title                   :string(255)
#  description             :text
#  publication_date        :date
#  publisher               :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  linkedin_publication_id :string(255)
#

require 'spec_helper'

describe Publication do
  pending "add some examples to (or delete) #{__FILE__}"
end
