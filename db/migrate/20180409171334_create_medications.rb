class CreateMedications < ActiveRecord::Migration[5.1]
  def change
    create_table :medications do |t|
      t.integer :strength
      t.string :strength_unit
      t.string :form
      t.integer :drug_id

      t.timestamps
    end
  end
end
