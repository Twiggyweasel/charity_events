class Event < ApplicationRecord
  enum status: [ :inactive, :draft, :active ]
  # Assocations
  belongs_to :organization, optional: true
  has_many :donations, as: :donatable

  # scopes
  scope :active, -> { where(status: :active) }
  scope :inactive, -> { where(status: :inactive) }

  # Validations
  validates_presence_of :name, :status, :start_date, :end_date, :description
end
