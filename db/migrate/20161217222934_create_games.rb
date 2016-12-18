class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.boolean :switched
      t.boolean :won

      t.timestamps
    end
  end
end
