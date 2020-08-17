class CreateCategoriesItems < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_items do |t|
      t.belongs_to :categorie, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
