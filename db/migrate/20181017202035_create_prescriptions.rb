class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions, id: false do |t|
      t.primary_key :id
      t.integer :frequency_per_day
      t.integer :days_supply
      t.references :disease, foreign_key: true

      t.timestamps
    end
  end
end
