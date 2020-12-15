class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :owner
      t.string :brand

      t.timestamps
    end
  end
end
