class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :family_name
      t.string :name
      t.string :email
      t.date :birthday
      t.string :phone
      t.string :cellphone
      t.string :bio
      t.string :carreer
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
