Rails.application.routes.draw do
  resources :testing_jobs, only: [:index]
  resources :companies
  resource :company_import, :controller => 'company_import', only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
