class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.string :place
      t.integer :nb_person

      t.timestamps
    end
  end
end
