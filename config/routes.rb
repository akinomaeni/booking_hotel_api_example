Rails.application.routes.draw do
  resources :booking, only: :create
end
