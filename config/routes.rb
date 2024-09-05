Rails.application.routes.draw do
  resources :fiscal_files, only: [:new, :create]
  root "fiscal_files#new"
end
