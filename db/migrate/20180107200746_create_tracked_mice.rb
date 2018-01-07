class CreateTrackedMice < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_mice do |t|
      t.references :user, foreign_key: true
      t.references :mouse, foreign_key: true

      t.timestamps
    end
  end
end
