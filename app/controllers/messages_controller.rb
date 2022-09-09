class MessagesController < ApplicationController
  before_action :set_room, only: %i[ new create ]
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = @room.messages.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = @room.messages.new(message_params)
    @message.user = current_user

    @message.save!

    respond_to do |format|
      format.turbo_stream
      # format.html { redirect_to @room }
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.turbo_stream
        format.html { redirect_to room_url(@message.room), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message.room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content)
    end
end
