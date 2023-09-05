Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]  #ユーザー編集に必要なeditとupdateメソッドを引き出す
  resources :rooms, only: [:new, :create] do  #ルーム新規作成に必要なnewとcreateメソッドを引き出す
    resources :messages, only: [:index, :create]
    #ネストにすることでroomsが親、messagesが子という親子関係になり、チャットルームに属するメッセージになる
    #メッセージに結びつくルームのidの情報を含んだパスを受け取れる
  end

end
