App.room = App.cable.subscriptions.find("RoomChannel") ||
  App.cable.subscriptions.create "RoomChannel",
    room_id: <%= @room.id %>
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      # Add the message to the chat log
      $('#messages').append(data.message)