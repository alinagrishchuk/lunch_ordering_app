class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.decimal :price, precision: 7, scale: 2
      t.date :date_from
      t.date :date_to
      t.references :product, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
