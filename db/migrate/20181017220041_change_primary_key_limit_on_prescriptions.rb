class ChangePrimaryKeyLimitOnPrescriptions < ActiveRecord::Migration[5.1]
  def change
    change_column :prescriptions, :id, :bigint
  end
end
