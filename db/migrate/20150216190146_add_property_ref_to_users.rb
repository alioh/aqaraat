class AddPropertyRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :property, index: true
    add_foreign_key :users, :properties
  end
end
