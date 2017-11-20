class RoomsController < ApplicationController
  def show
    @room = current_user.room_for(params[:partner_id])
    @messages = @room.messages
  end
end