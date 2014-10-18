class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user
      t.string :personaname
      t.boolean :multiplayer?
      t.timestamps
    end
  end
end
