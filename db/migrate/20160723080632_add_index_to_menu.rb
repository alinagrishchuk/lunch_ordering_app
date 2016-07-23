class AddIndexToMenu < ActiveRecord::Migration
  def change
    add_index :menus, [:date_from, :date_to]
  end
end
