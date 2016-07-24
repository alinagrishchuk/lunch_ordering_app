class AddDateIndesToOrders < ActiveRecord::Migration
  def change
    add_index :orders, :date
  end
end
