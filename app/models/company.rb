class Company < ApplicationRecord
  has_many :proposals, dependent: :destroy
  scope :by_name, -> { order(:sales_name) }

  def self.ransackable_attributes(auth_object = nil)
    %w[legal_name sales_name cnpj]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
