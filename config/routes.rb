Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update]  #ユーザー編集に必要なeditとupdateメソッドを引き出す
  
end
