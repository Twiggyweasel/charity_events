class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :registerable, :confirmable

  # Assocations
  has_many :organization_members
  has_many :organizations, through: :organization_members
  has_one :organization
  # Validations
  # validates_presence_of :first_name, :last_name, :email

  # methods
  def full_name
    first_name + " " + last_name
  end
end
