class GtMetrixTest < ApplicationRecord
  validates :company_id, uniqueness: true

  belongs_to :company
end
