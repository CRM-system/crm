class AddColumnsToLanding < ActiveRecord::Migration[5.2]
  def change
    add_column :landings, :address, :string
    add_column :landings, :organization, :string
    add_column :landings, :owner, :string
  end
end
