class MessagesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_message, except: [:index, :new, :create]

  def index
    @messages = Message.all.order(:id, :desc)
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      @message = Message.new
      render :new
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      render :edit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
