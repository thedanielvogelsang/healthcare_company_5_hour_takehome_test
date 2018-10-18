class Prescriber < ApplicationRecord
  has_many :prescription_histories
  has_many :prescriptions, through: :prescription_histories
  has_many :medications, through: :prescription_histories
  has_many :drugs, through: :medications
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true

  validate :validate_numeric_id

  def validate_numeric_id
    return id.to_i === 0 ? errors.add(:id, "id must be an Integer") : true
  end
  
end
