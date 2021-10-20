class CreateUserFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :user_friends do |t|
      t.references :user
      t.references :friend
      t.timestamps
    end
  end
  add_foreign_key :user_friends, :user, column: :user_id, primary_key: :id
  add_foreign_key :user_friends, :user, column: :friend_id, primary_key: :id
end
