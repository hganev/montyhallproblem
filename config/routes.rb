Rails.application.routes.draw do
  root 'games#start'

  get 'games/play'
  get 'games/start'
  get 'games/reveal'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
