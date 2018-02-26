require 'uri'

class Company < ApplicationRecord

  has_many :gt_metrix_tests, dependent: :destroy
  has_many :testing_jobs, dependent: :destroy

  validates :name, presence: true
  validates :website_url, presence: true
  validates :website_url, format: { with: URI.regexp }, if: -> { URI.present? }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
