class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :course_type
      t.string :name

      t.timestamps null: false
    end
  end
end
