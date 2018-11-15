class Drug < ApplicationRecord
  scope :addictive, -> {where(opioid: true)}
  scope :not_addictive, -> { where(opioid: false)}

  has_many :medications
  has_many :prescription_histories, through: :medications
  has_many :prescribers, through: :prescription_histories

  def main_distributor
    Hospital.joins(:prescription_histories)
            .joins(:medications)
            .joins(:drugs).where(:drugs => {id: id})
            .group("hospitals.id")
            .order("COUNT(hospitals.id) DESC")
            .first
  end
end
