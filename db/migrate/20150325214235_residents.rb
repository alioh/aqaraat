class Residents < ActiveRecord::Migration
  def change
  	add_column :bills, :resident_id, :integer
  	add_column :properties, :resident_id, :integer
  	add_column :users, :resident_id, :integer
  	add_column :residents, :bill_id, :integer
  	add_column :residents, :property_id, :integer
  end
end
