class AddRoomIdToRoomMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :room_messages, :room_id, :integer
  end
end
