class AddViewCountToTrains < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :view_count, :integer
  end
end
