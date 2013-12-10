class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :authenticated
      t.string :email
      t.boolean :merchant

      t.timestamps
    end
  end
end
