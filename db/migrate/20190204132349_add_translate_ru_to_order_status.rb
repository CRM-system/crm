class AddTranslateRuToOrderStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :order_statuses, :translate_ru, :string
  end
end
