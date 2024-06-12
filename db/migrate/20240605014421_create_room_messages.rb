class CreateRoomMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :room_messages do |t|
      t.string :message

      t.timestamps
    end
  end
end
