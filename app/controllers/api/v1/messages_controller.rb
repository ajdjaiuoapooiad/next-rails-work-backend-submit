class Api::V1::MessagesController < ApplicationController
  before_action :authorize_request

  def index
    @messages = Message.where(sender_id: current_user.id).or(Message.where(receiver_id: current_user.id))
    render json: @messages.map { |message|
      message.as_json.merge(
        sender_username: message.sender&.name,
        receiver_username: message.receiver&.name
      )
    }
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      render json: @message, status: :created
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:receiver_id, :content)
  end
end