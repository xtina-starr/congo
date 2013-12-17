class CreateProductToCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :product_to_category_relationships do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps
    end
  end
end
