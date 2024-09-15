class Standard < ApplicationRecord
  has_many :items, dependent: :restrict_with_exception
  scope :by_name, -> { order(name: :asc) }
end
