Rails.application.routes.draw do

  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  root "user/homes#top"

  namespace :admin do
    get 'homes/top'
  end

  namespace :user do
    get 'homes/top'
  end

end
