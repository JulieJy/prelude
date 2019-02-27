class AddBarToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :bar_id, :integer, index: true
  end
end
