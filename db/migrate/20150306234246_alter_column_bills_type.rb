class AlterColumnBillsType < ActiveRecord::Migration
  def change
  	rename_column :bills, :type, :billtype
  end
end
