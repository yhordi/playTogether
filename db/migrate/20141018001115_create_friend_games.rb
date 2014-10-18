class CreateFriendGames < ActiveRecord::Migration
  def change
    create_table :friend_games do |t|
      t.references :friend
      t.string :title
      t.timestamps
    end
  end
end
