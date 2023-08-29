Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :users, only: [:edit, :update]  #ユーザー編集に必要なeditとupdateメソッドを引き出す
  resources :rooms, only: [:new, :create]  #ルーム新規作成に必要なnewとcreateメソッドを引き出す

end
