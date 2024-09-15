class Company < ApplicationRecord
  has_many :proposals, dependent: :destroy
  scope :by_name, -> { order(:sales_name) }
end
