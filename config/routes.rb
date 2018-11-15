Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/hospitals', to: "api/v1/hospitals/hospital#index"
  get '/hospitals/:id', to: "api/v1/hospitals/hospital#show"
  get '/diseases', to: "api/v1/diseases/disease#index"
  get '/diseases/:id', to: "api/v1/diseases/disease#show"
  get '/medications', to: "api/v1/medications/medication#index"
  get '/medications/:id', to: "api/v1/medications/medication#show"
  get '/prescribers', to: "api/v1/prescribers/prescriber#index"
  get '/prescribers/:id', to: "api/v1/prescribers/prescriber#show"
  get '/prescriptions', to: "api/v1/prescriptions/prescription#index"
  get '/prescriptions/:id', to: "api/v1/prescriptions/prescription#show"
  get '/drugs', to: "api/v1/drugs/drug#index"
  get '/drugs/:id', to: "api/v1/drugs/drug#show"

end
