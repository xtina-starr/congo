class AddImageAndStockToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image, :string
    add_column :products, :stock, :integer
  end
end
