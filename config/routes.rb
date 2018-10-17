Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/hospitals', to: "api/v1/hospitals/hospital#index"
  get '/hospitals/:id', to: "api/v1/hospitals/hospital#show"
end
