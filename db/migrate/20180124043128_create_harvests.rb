class CreateHarvests < ActiveRecord::Migration[5.1]
  def change
    create_table :harvests do |t|
      t.references :mouse, foreign_key: true
      t.date :date_of_harvest
      t.float :weight_in_g
      t.float :protein_ug_per_ml
      t.float :brain_temp

      t.timestamps
    end
  end
end
