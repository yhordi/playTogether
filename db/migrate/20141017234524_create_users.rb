class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :personaname
      t.string :realname
      t.string :avatarmedium
      t.string :steamid
      t.timestamps
    end
  end
end
