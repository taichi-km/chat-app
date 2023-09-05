class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path  #保存に成功したらルートバスにリダイレクト
    else
      render :new, status: :unprocessable_entity  #失敗したらrooms/new.heml.erbを表示
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end


  private

  def room_params  #保存する前に許可する前に許可するパラメーターを指定する
    params.require(:room).permit(:name, user_ids: [])
  end

end