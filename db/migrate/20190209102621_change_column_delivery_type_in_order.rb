class ChangeColumnDeliveryTypeInOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_type, :string
    add_column :orders, :delivery_type, :integer
  end
end
