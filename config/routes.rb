Rails.application.routes.draw do
  # Ruta para generar una palabra aleatoria de cierta longitud
  get '/words/random/:length', to: 'words#random_word'

  # Rutas para usuarios
  resources :users, only: [:create]
  patch '/users/:id', to: 'users#update_status', as: 'update_user_status'
end