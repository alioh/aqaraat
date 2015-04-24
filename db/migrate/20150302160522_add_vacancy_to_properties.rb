class AddVacancyToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :vacancy, :string
  end
end
