Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
     #createの左横のシンボルマーク「：」忘れる
     #rails起動しなくなる
    #  vsコードの文字の色が水色だったために他の横並びの
    #  深い青色の文字と対照的でわかったと言われていた
    #  Traceback (most recent call last):
        # 84: from bin/rails:3:in `<main>'
        # 83: from bin/rails:3:in `load'
        # 82: from /Users/maedatakuo/projects/chat-app/bin/spring:15:in `<top (required)>'
        # 中略
# /Users/maedatakuo/projects/chat-app/config/routes.rb:8:in `block (2 levels) in <main>': undefined local variable or method `create' for #<ActionDispatch::Routing::Mapper:0x00007f9fd3064e90> (NameError)
