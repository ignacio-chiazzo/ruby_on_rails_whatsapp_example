class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = Message.last(25).reverse
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    wpp_message = WhatsappSdk::Api::Messages.new.send_text(
      sender_id: message_params["sender_number"].to_i,
      recipient_number: message_params["recipient_number"].to_i,
      message: message_params["message"]
    )
    
    # We either store response["data"] or response["error"]. 
    raw_response = wpp_message.data&.raw_data_response || wpp_message.error&.raw_data_response

    @message = Message.create(
      message: message_params["message"],
      sender_number: message_params["sender_number"],
      recipient_number: message_params["recipient_number"],
      status: wpp_message.ok? ? Message::Status::DELIVERED : Message::Status::FAILED,
      raw_response: JSON.parse(raw_response.to_json)
    )

    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:message, :sender_number, :recipient_number)
    end
end
