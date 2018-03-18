class GtMetrixTest < ApplicationRecord
  validates :company_id, uniqueness: true

  scope :by_page_speed, -> (from, to) { where("pagespeed_score >= ? AND pagespeed_score <= ?", from, to) }
  scope :by_yslow_score, -> (from, to) { where("yslow_score >= ? AND yslow_score <= ?", from, to) }

  belongs_to :company
end
