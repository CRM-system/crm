class AddAdminToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :admin, :boolean, default: false

  end
end
