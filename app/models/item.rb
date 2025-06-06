class Item < ApplicationRecord
  belongs_to :proposal
  belongs_to :standard
  belongs_to :user, required: false
  before_create :calc_total_days
  before_create :calc_total_price
  after_create :update_proposal_total_cost
  after_destroy :update_proposal_total_cost

  validates :stage, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :stage, presence: true
  validates :onsite_man_days, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0.0 }
  validates :off_site_man_days, presence: true, numericality: { only_float: true }
  validates :man_day_rate, presence: true, numericality: { only_float: true }

  def scheduled? = start_time.present?

  def not_scheduled? = start_time.nil?

  private
  def calc_total_days
    self.total_days = self.onsite_man_days + self.off_site_man_days
  end

  def calc_total_price
    total = self.total_days * self.man_day_rate
    self.total_cost = total.round(2)
  end
  def update_proposal_total_cost
    proposal.calc_total_cost
    proposal.save
  end
end
