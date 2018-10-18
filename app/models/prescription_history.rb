class PrescriptionHistory < ApplicationRecord
  belongs_to :prescriber
  belongs_to :hospital
  belongs_to :medication
  belongs_to :prescription

  def self.most_effective_opioid_prescribers(limit=1)
     Prescriber
       .select("prescriptions.*, SUM(prescriptions.frequency_per_day * prescriptions.days_supply) AS EFF_DOSE")
       .joins(:prescription_histories)
       .joins(:medications)
       .joins(:drugs)
       .merge(Drug.addictive)
       .joins(:prescription_histories => :prescription)
       .group("prescriptions.id")
       .order("EFF_DOSE DESC")
       .limit(limit)
  end

  def self.most_effective_non_opioid_prescribers(limit=1)
     Prescriber
       .select("prescriptions.*, SUM(prescriptions.frequency_per_day * prescriptions.days_supply) AS EFF_DOSE")
       .joins(:prescription_histories)
       .joins(:medications)
       .joins(:drugs)
       .merge(Drug.not_addictive)
       .joins(:prescription_histories => :prescription)
       .group("prescriptions.id")
       .order("EFF_DOSE DESC")
       .limit(limit)
  end

end
