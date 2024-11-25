class Standard < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :items, dependent: :restrict_with_exception
  scope :by_name, -> { order(name: :asc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
