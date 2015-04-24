class ChangeColumnName < ActiveRecord::Migration
  def change
	rename_column :properties, :name, :addresstype
  end
end
