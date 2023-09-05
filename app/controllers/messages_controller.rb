class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    #@room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、messages_paramsを引用してprivateメソッドを呼び出す
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  
  def message_params  #messageの内容(content)をmessagesテーブルへ保存できるようにする
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    #パラメーターの中にログインしているユーザーのidと紐づいたcontentを受け取れるように許可する
  end


    

end
