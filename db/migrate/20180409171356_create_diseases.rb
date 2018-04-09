class CreateDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :diseases do |t|
      t.string :name

      t.timestamps
    end
  end
end
