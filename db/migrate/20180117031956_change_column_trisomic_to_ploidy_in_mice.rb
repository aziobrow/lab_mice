class ChangeColumnTrisomicToPloidyInMice < ActiveRecord::Migration[5.1]
  def change
    rename_column :mice, :trisomic, :ploidy
    change_column :mice, :ploidy, :string
    rename_column :mice, :status, :harvest_status
    rename_column :mice, :original_id, :lab_id
    add_column :mice, :treatment_status, :integer
    add_column :mice, :active_status, :integer
  end
end
