class Proposal < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :company
  belongs_to :user
  before_save :calc_total_cost

  enum discount_type: { percentage: 'percentage', fixed: 'fixed' }

  validates :discount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :discount_type, inclusion: { in: discount_types.keys }, allow_nil: true

  def last_updated_at
    return ((Time.now - self.updated_at) / 1.day).to_i if self.items.empty?

    most_recent_item = self.items.max_by(&:updated_at)
    latest_update = [ self.updated_at, most_recent_item.updated_at ].max
    ((Time.now - latest_update) / 1.day).to_i
  end

  def calc_total_cost
    return unless items.present?

    total = items.sum(:total_cost).round(2)

    if discount.present? && discount_type.present?
      case discount_type
      when 'percentage'
        discount_amount = total * (discount.to_f / 100)
        self.total_cost = (total - discount_amount).round(2)
      when 'fixed'
        self.total_cost = [ total - discount.to_f, 0 ].max.round(2)
      else
        self.total_cost = total
      end
    else
      self.total_cost = total
    end
  end
end
