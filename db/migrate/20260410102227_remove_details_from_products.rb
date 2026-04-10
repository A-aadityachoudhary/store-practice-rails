class RemoveDetailsFromProducts < ActiveRecord::Migration[8.1]
  def change
    remove_column :products, :part_number, :string
    remove_column :products, :price, :decimal
    remove_column :products, :gst, :decimal
  end
end
