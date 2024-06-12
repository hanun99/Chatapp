class Room < ApplicationRecord

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages
  
end


