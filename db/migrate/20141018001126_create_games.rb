class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user
      t.string :title
      t.boolean :multiplayer?
      t.timestamps
    end
  end
end