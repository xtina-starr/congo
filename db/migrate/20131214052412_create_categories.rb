class CreateCategories < ActiveRecord::Migration
  drop_table :categories
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
