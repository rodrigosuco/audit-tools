class Item < ApplicationRecord
  belongs_to :standard
  before_save :calc_toral_price
  before_save :calf_total_days

  private
  def calc_toral_days
    self.total_days = self.onsite_man_days + self.off_site_man_days
  end

  def calc_total_price
    self.total_cost = self.total_days * self.man_day_rate
  end
end
