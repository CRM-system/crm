class CreateFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :functions do |t|
      t.string :name
      t.boolean :access, default: false
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
