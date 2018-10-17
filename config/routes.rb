Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/hospitals', to: "api/v1/hospitals/hospital#index"
  get '/hospitals/:id', to: "api/v1/hospitals/hospital#show"
  get '/diseases', to: "api/v1/diseases/disease#index"
  get '/diseases/:id', to: "api/v1/diseases/disease#show"
  get '/medications', to: "api/v1/medications/medication#index"
  get '/medications/:id', to: "api/v1/medications/medication#show"
  
end
