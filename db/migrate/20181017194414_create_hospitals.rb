class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals, id: false do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
