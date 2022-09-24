class WhatsappWebhooksController < ApplicationController
  # This endpoint is called from Meta to validate the endpoint.
  # The API must respond with the "hub.challenge" param sent by Meta.
  def index
    respond_to do |format|
      format.json { render json: params["hub.challenge"] }
    end
  end

  # This endpoint is set in Meta to receive Webhooks
  def receive_webhook
    puts "Webhook received: #{params}"
  end
end