class AlterColumnBillsAmount < ActiveRecord::Migration
  def up
    change_column :bills, :amount, :integer
  end

  def down
    change_column :bills, :amount, :string
  end
end
