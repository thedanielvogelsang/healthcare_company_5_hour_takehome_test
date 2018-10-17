class Prescriber < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
end
