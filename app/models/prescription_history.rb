class PrescriptionHistory < ApplicationRecord
  belongs_to :prescriber
  belongs_to :hospital
  belongs_to :medication
  belongs_to :prescription

end
