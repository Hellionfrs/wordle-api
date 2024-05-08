Rails.application.routes.draw do
  get '/words/random/:length', to: 'words#random_word'
end