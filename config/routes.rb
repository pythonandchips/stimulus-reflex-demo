Rails.application.routes.draw do
  resources :invoices, only: %i[index new create show edit update]
end
