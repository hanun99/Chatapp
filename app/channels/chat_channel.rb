class ChatChannel < ApplicationCable::Channel
    def subscribed
      @room_id = params[:room_id]
      stream_from "chat_#{@room_id}"
    end
  
    def receive(data)
      message = Message.create(content: data["message"], room_id: @room_id)
      broadcast_to "chat_#{@room_id}", message: message.as_json
    end
  end