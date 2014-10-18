class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user
      t.string :personaname
      t.timestamps
    end
  end
end
