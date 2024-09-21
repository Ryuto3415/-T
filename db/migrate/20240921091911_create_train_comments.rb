class CreateTrainComments < ActiveRecord::Migration[6.1]
  def change
    create_table :train_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :train_id

      t.timestamps
    end
  end
end
