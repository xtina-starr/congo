class AddCheckoutColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :email, :string
    add_column :orders, :mailing_address, :string
    add_column :orders, :name_on_cc, :string
    add_column :orders, :cc_number, :integer
    add_column :orders, :cc_expiration, :integer
    add_column :orders, :cc_cvv, :integer
    add_column :orders, :billing_zip, :integer
  end
end
