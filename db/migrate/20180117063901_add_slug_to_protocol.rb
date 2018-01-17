class AddSlugToProtocol < ActiveRecord::Migration[5.1]
  def change
    add_column :protocols, :slug, :string
  end
end
