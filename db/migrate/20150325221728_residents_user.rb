class ResidentsUser < ActiveRecord::Migration
  def change
  	add_column :residents, :user_id, :integer
  end
end
