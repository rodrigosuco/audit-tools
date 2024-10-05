class Role < ApplicationRecord
  scope :by_name, -> { order(name: :asc) }
end
