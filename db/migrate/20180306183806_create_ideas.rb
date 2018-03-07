class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title, null: false
      t.text :description, default: ""
      t.string :poster, null: false
      t.integer :votes, default: 0
      t.string :status, default: 'Idea'
      t.boolean :done, default: false, null: false

      t.timestamps null: false
    end
  end
end
