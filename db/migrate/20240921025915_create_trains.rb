class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
