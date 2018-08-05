class Organization < ApplicationRecord
  # Associations
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :organization_members
  has_many :members, through: :organization_members, source: :user
  has_many :events
  has_many :donations, through: :events
  # Validations
  validates_presence_of :name
end
