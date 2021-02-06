Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  #schools routes
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  post '/schools', to: 'schools#create'
  get '/schools/:id', to: 'schools#show'
  get '/schools/:id/edit', to: 'schools#edit'
  patch '/schools/:id', to: 'schools#update'
  # resources :schools
  delete '/schools/:id', to: 'schools#destroy'
  # get '/schools/:id/destroy', to: 'schools#destroy'
  # delete '/schools/:id', to: 'schools#destroy'
  #students routes
  get '/students', to: 'students#index'

  get '/hockeyteams', to: 'hockey_teams#index'
  get '/hockeyteams/new', to: 'hockey_teams#new'
  post '/hockeyteams', to: 'hockey_teams#create'
  get '/hockeyteams/:id', to: 'hockey_teams#show'
end
