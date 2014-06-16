class RelatedPerson < ActiveRecord::Base
  has_many :account_documents
end
