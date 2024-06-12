class RoomsController < ApplicationController
    # Loads:
    # @rooms = all rooms
    # @room = current room when applicable
   
    before_action :load_entities
  
    def load_entities
      @rooms = Room.all
      @room = Room.find(params[:id]) if params[:id]
    end
    
    def show
      @room = Room.find(params[:id])
    if @room
      @room_messages = @room.room_messages
      @room_message = RoomMessage.new
    else
      flash[:alert] = "Room not found"
      redirect_to root_path
    end
  
    
    def index
      @room= Room.all
    end
  
    def new
      @room = Room.new
    end
  
    def create
      @room = Room.new permitted_parameters
  
      if @room.save
        flash[:success] = "Room #{@room.name} was created successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @room.update_attributes(permitted_parameters)
        flash[:success] = "Room #{@room.name} was updated successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
  
  
    
  
    def permitted_parameters
      params.require(:room).permit(:name)
    end
  
    
      # ... other logic for the action
    end
  end