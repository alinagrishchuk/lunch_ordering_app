class AddNameIndexToProducts < ActiveRecord::Migration
  def up
    execute %{
      CREATE INDEX
        products_name_trgm_idx
      ON
        users
      USING
        gist (name gist_trgm_ops);
    }
  end

  def down
    remove_index :products, name: 'products_name_trgm_idx'
  end
end
