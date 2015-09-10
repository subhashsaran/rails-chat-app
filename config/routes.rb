Rails.application.routes.draw do

  resources :coment_replies

  resources :coments

  resources :comments

  resources :articles


  resources :models

  devise_for :users
  resources :users

  authenticated :user do
    root 'articles#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end


end
