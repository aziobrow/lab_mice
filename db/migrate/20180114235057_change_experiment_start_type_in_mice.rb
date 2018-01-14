class ChangeExperimentStartTypeInMice < ActiveRecord::Migration[5.1]
  def change
    change_column :mice, :experiment_start_date, 'date using experiment_start_date::date'
  end
end
