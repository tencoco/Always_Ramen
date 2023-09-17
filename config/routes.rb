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
    resources :users, only: [:index, :show, :destroy]
  end

  namespace :user do
    get 'homes/top'
    get "search" => "searches#search"
    resources :users, only: [:show, :edit, :update]
    resources :shops, only: [:show, :index] do
      resource :review
    end
  end

end
