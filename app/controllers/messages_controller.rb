class MessagesController < ApplicationController

  def create
    @message = current_user.messages.create(message_params)
    redirect_to root_path, notice: 'message sent'
  end

private

  def message_params
    params.require(:message).permit(:text)
  end

end
