Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /en|ru/ do
    resources :pages do
      resources :blocks, except: %i[index show]
    end
    root 'main#index'
  end
end
