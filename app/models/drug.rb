class Drug < ApplicationRecord
  scope :addictive, -> {where(opioid: true)}
  scope :not_addictive, -> { where(opioid: false)}

  has_many :medications
end
