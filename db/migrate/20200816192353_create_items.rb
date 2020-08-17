class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :size
      t.integer :quantity
      t.string :color
      t.float :price
      t.integer :creator_id

      t.timestamps
    end
  end
end
