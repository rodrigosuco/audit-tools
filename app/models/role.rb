class Role < ApplicationRecord
  scope :by_name, -> { order(name: :asc) }
  has_many :users
end
