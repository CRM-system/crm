class AddModelNameAndDescriptionToFunctions < ActiveRecord::Migration[5.2]
  def change
    add_column :functions, :model_name, :string
    add_column :functions, :description, :text
  end
end
