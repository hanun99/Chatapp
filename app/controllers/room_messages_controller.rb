class RoomMessagesController <ApplicationController

    protect_from_forgery with: :null_session
    before_action :load_entities
    skip_before_action :verify_authenticity_token, only: [:create]


  
def load_entities
  @rooms = Room.all
  @room = Room.find(params[:id]) if params[:id]
end    

    def index
        # Implement logic to fetch and display room messages here
        @room_messages = RoomMessage.all
        render json: @room_messages 
       # Example: Fetch all messages
      end
      def create
        room_message_params = params.require(:room_message).permit(:room_id, :message)
    if params[:room_message][:room_id].present?
      @room = Room.find(params[:room_message][:room_id])
      @room_message = RoomMessage.new user: current_user,
                                         room: @room,
                                         message: params.dig(:room_message, :message)
    else
      render :show
    end
        #...
      end

            def show
              @room = Room.find_by(id: params[:id])# Add this line
              if @room
                @room_message = @room.room_messages.create
              else
                flash[:alert] = "Room not found"
                redirect_to root_path
              end
end
end

        