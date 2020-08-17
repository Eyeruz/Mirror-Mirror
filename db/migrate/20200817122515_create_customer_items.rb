class CreateCustomerItems < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_items do |t|
      t.belongs_to :customer
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
