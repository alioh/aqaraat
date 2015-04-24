class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :rent

      t.timestamps null: false
    end
  end
end
