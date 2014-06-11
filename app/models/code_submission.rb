class CodeSubmission < ActiveRecord::Base
  belongs_to :parent, polymorphic: true, primary_key: :uid
  belongs_to :user
  belongs_to :project
end
