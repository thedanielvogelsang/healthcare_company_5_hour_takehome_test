class CreatePrescriptionHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :prescription_histories do |t|
      t.references :prescriber, foreign_key: true
      t.references :hospital, foreign_key: true
      t.references :medication, foreign_key: true
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end
