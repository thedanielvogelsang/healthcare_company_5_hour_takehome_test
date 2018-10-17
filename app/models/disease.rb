class Disease < ApplicationRecord
  has_many :prescriptions

  def most_commonly_ordered_medication
    Medication.joins(:prescription_histories).joins(:prescriptions)
              .where(:prescriptions => {disease_id: id})
              .group("medications.id").order("COUNT(medications.id) DESC").first
  end

end
