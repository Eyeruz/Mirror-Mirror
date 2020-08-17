class CreateCustomerItems < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_items do |t|
      t.belong_to :customer
      t.belongs_to--no-test-framework :item

      t.timestamps
    end
  end
end
