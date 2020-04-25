Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :pages do
      resources :blocks, except: %i[index show]
    end

    resources :users, only: %i[index show]
    root 'main#index'
  end
end
