Rails.application.routes.draw do
  #コントローラーの指定と余分なルーティングの削除
  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }

  #コントローラーの指定と余分なルーティングの削除
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  root "user/homes#top"

  namespace :admin do
    get 'homes/top'
    resources :shops, only: [:new, :show, :edit, :index, :create, :destroy, :update]
  end

  namespace :user do
    get 'homes/top'
    resources :users, only: [:show, :edit, :update]
    resources :shops, only: [:show, :index]
  end

end
