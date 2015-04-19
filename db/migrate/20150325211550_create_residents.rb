class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :name
      t.text :details

      t.timestamps null: false
    end
  end
end
