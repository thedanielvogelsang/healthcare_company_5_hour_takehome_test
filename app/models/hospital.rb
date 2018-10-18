class Hospital < ApplicationRecord
  has_many :prescription_histories
  has_many :medications, through: :prescription_histories
  has_many :drugs, through: :medications
  
  validates :id, presence: true, uniqueness: true
  validates_presence_of :name

  validate :validate_numeric_id

  def validate_numeric_id
    return id.to_i === 0 ? errors.add(:id, "id must be an Integer") : true
  end

  def most_prescribed
    Hospital.find(id).prescription_histories
                     .joins(:medication).group('medications.drug_id')
                     .order("COUNT(medications.id) DESC").first.medication.drug
  end
end
