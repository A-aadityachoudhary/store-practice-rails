class AddDetailsToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :lastName, :string
    add_column :products, :gst, :decimal
  end
end
