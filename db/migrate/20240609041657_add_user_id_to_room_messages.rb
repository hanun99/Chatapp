class AddUserIdToRoomMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :room_messages, :user, null: false, foreign_key: true
  end
end
