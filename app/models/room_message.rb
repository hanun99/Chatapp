class RoomMessage <ApplicationRecord

    belongs_to :room,inverse_of: :room_message
    has_one  :room_messages
    belongs_to :user
    
    

    def create
       @room_message = RoomMessage.create user: current_user,
        room: @room,
        message: params.dig(:room_message, :message)
end
end






        
