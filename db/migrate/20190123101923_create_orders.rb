class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string     :client_name
      t.string     :client_phone
      t.string     :client_email
      t.string     :client_addres
      t.string     :delivery_type
      t.decimal    :order_price
      t.integer    :quantity
      t.decimal    :total_price
      t.integer    :status, default: 0
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
