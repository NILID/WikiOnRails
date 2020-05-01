Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :pages do
      resources :sections, except: %i[index show]
      member do
        get :history
      end
    end

    resources :users, only: %i[index show]
    root 'main#index'
  end
end
