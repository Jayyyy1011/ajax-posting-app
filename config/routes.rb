Rails.application.routes.draw do

  devise_for :users

  root "posts#index"

  resources :posts do
    member do
      post "like" => "posts#like"
      post "unlike" => "posts#unlike"
      post "collect" => "posts#collect"
      post "cancel" => "posts#cancel"
    end
  end

  resources :collects
  
  get "jquery-1" => "pages#jquery_1"
  get "jquery-2" => "pages#jquery_2"
  get "jquery-3" => "pages#jquery_3"
  get "jquery-4" => "pages#jquery_4"
  get "jquery-5" => "pages#jquery_5"



end
