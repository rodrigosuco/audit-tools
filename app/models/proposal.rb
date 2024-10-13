class Proposal < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :company
  before_save :calc_total_cost

  private

  def calc_total_cost
    return unless self.items.present?
    self.total_cost = self.items.map(&:total_cost).inject(:+).round(2)
  end
end
