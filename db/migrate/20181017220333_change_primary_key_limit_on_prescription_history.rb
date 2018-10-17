class ChangePrimaryKeyLimitOnPrescriptionHistory < ActiveRecord::Migration[5.1]
  def change
    change_column :prescription_histories, :medication_id, :bigint
    change_column :prescription_histories, :hospital_id, :bigint
    change_column :prescription_histories, :prescriber_id, :bigint
    change_column :prescription_histories, :prescription_id, :bigint
  end
end
