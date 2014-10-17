class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :personaname
      t.string :realname
      t.string :steamid
      t.string :profileurl
      t.string :avatarmedium
      t.timestamps
    end
  end
end
