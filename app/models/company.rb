require 'uri'

class Company < ApplicationRecord
  validates :name, presence: true
  validates :website_url, presence: true
  validates :website_url, format: { with: URI.regexp }, if: -> { URI.present? }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
