class Medication < ApplicationRecord
  has_many :prescription_histories
  belongs_to :drug
  has_many :prescriptions, through: :prescription_histories

end
