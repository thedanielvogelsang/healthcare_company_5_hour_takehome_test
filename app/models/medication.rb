class Medication < ApplicationRecord
  belongs_to :drug
  has_many :prescriptions
end