class Item < ApplicationRecord
  belongs_to :proposal
  belongs_to :standard
  before_save :calc_total_days
  before_save :calc_total_price

  private
  def calc_total_days
    self.total_days = self.onsite_man_days + self.off_site_man_days
  end

  def calc_total_price
    total = self.total_days * self.man_day_rate
    self.total_cost = total.round(2)
  end
end
