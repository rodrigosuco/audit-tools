class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :recoverable
  has_many :proposals
  has_many :items
  has_and_belongs_to_many :standards
  validates :role, presence: true

  enum :role, { super_admin: 'Super Admin', admin: 'Admin', auditor: 'Auditor', common: 'Common' }

  def auditor? = role.present? && role == 'auditor'

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
