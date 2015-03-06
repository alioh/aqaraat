class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.date :duedate
      t.string :amount
      t.string :type
      t.string :status
      t.text :description

      t.timestamps null: false
    end
  end
end
