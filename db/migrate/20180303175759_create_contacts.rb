class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email, unique: true
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :birthday_month
      t.integer :birthday_day

      t.timestamps null: false
    end
  end
end
