class ChangeCareerColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :carreer, :career
  end
end
