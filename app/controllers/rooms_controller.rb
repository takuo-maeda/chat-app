class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  #３月５日（金） Routing Error
   # No route matches [POST] "/rooms/new"
  #  フロント実装問１０番
  #  def
  #  end
  # ままになっていた
  # ルートエラーは新規チャットルームのcreateボタン
  #route errorは次に⇨<%=form_with model: @room, local: true do |f|%>の＠roomからコントローラー
  #rooms_controllerの２行目から３行目に（上の分コード）「@room = Room.new」が記述されていなかった
  def create
    # binding pry
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
