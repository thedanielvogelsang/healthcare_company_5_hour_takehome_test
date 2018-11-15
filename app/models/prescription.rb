class Prescription < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates_presence_of :frequency_per_day
  validates_presence_of :days_supply
  belongs_to :disease
  has_many :prescription_histories

  validate :validate_numeric_id

  def validate_numeric_id
    return id.to_i === 0 ? errors.add(:id, "id must be an Integer") : true
  end
end
