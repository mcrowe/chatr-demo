class MessagesController < ApplicationController

  # GET /messages?limit=10
  def index
    limit = params[:limit] || 5
    render json: Message.order(created_at: :desc).limit(limit)
  end

  # POST /messages
  # body=my+body
  def create
    message = Message.new
    message.body = params[:body]
    message.save

    # render nothing: true
    # head :ok # 200 status code
    head :created # 201 status code
  end

end