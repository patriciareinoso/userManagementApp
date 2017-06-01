class ChangeRateColumn < ActiveRecord::Migration
	def change
		add_column :users, :currency, "ENUM('dollar','euro')"
		change_column :users, :rate, :decimal, :precision => 15, :scale => 2
	end
end
