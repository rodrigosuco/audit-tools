class Proposal < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :company
end
