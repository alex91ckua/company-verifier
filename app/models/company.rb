require 'uri'

class Company < ApplicationRecord

  has_one :gt_metrix_test, dependent: :destroy
  has_one :testing_job, dependent: :destroy

  validates :name, presence: true
  validates :website_url, presence: true
  validates :website_url, format: { with: URI.regexp }, if: -> { URI.present? }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
