Rails.application.routes.draw do

  devise_for :users

  scope '(:locale)', locale: /en|ru/ do
    resources :pages
    root 'main#index'
  end
end
