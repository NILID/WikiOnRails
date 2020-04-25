Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /ru|en/ do
    root 'main#index'
  end
end
