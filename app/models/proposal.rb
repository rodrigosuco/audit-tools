class Proposal < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :company
  before_save :calc_total_cost

  def last_updated_at
    return ((Time.now - self.updated_at) / 1.day).to_i if self.items.empty?
    most_recent_item = self.items.max_by(&:updated_at)
    ((Time.now - most_recent_item.updated_at) / 1.day).to_i
  end

  private

  def calc_total_cost
    return unless self.items.present?
    self.total_cost = self.items.map(&:total_cost).inject(:+).round(2)
  end

end
