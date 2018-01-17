class AddProtocolToMice < ActiveRecord::Migration[5.1]
  def change
    add_reference :mice, :protocol, foreign_key: true
  end
end
