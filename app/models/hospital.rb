class Hospital < ApplicationRecord
  has_many :prescription_histories
  validates :id, presence: true, uniqueness: true
  validates_presence_of :name

  validate :validate_numeric_id

  def validate_numeric_id
    return id.to_i === 0 ? errors.add(:id, "id must be an Integer") : true
  end
end
