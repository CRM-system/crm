class ChangeColumnInFunction < ActiveRecord::Migration[5.2]
  def change
    rename_column :functions, :model_name, :model
  end
end
