class AddLandingIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :landing, foreign_key: true
  end
end
