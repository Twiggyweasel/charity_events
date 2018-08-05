class OrganizationMember < ApplicationRecord
  enum role: [ :editor, :reader ]
  belongs_to :organization
  belongs_to :user

  validates_presence_of :role
end
