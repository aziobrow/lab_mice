class DeleteHarvestColumnsInMice < ActiveRecord::Migration[5.1]
  def change
    remove_column :mice, :protein_ug_per_ml
    remove_column :mice, :harvest_date
    remove_column :mice, :harvest_brain_temp
    remove_column :mice, :weight_in_grams
  end
end
