class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :nb_player
      t.integer :duration
      t.string :rules
      t.text :description
      t.string :picture
      t.string :category

      t.timestamps
    end
  end
end
