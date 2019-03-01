class Changedurationtobestringingames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :duration, :string
  end
end
