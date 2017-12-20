Rails.application.routes.draw do
  resources :notes, except: :show
end
