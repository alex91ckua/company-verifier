Rails.application.routes.draw do
  resources :gt_metrix_tests, only: [:index, :show]
  resources :companies, only: [:index, :show]
  resources :test_logs, only: [:index, :show]
  resource :propose, only: [:show, :update]
  resource :company_import, :controller => 'company_import', only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
