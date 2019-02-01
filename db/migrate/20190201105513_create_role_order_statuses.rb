class CreateRoleOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :role_order_statuses do |t|
    	t.belongs_to :role, index: true
    	t.belongs_to :order_status, index: true 

      t.timestamps
    end
  end
end
