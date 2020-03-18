class MessagesController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  def index
    @message = Message.all
    @search = Message.ransack(params[:q])
    @results = @search.result
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      # delete(" ")で文字列から全ての空白を削除する
      # split(",")で受け取った文字列をカンマ（,）区切りで配列にする
      tag_list = message_params[:tag_list].delete(" ").split(",")

      redirect_to @message
    else
      render 'new'
    end
  end


  def show
    @message = Message.all
    @messages = @message
  end

  private
  def message_params
    params.require(:message).permit(:title, :content,:image,:tag_list ).merge(user_id: current_user.id)
  end

  def set_tweet
    @message = Message.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
