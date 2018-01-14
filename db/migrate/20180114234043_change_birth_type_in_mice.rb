class ChangeBirthTypeInMice < ActiveRecord::Migration[5.1]
  def change
    change_column :mice, :date_of_birth, 'date using date_of_birth::date'
  end
end
