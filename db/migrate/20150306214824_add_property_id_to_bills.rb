class AddPropertyIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :property_id, :integer
    add_index :bills, :property_id
  end
end
