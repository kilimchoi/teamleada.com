class CodeSubmission < ActiveRecord::Base
  belongs_to :parent, polymorphic: true, primary_key: :uid
end
