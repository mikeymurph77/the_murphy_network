class ChangeContactBorthdayDataTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :contacts, :birthday_month, :string
    change_column :contacts, :birthday_day, :string
  end
end
