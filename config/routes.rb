Rails.application.routes.draw do
  root "notes#index"
  resources :notes
  match "note/trash" => "buckets#trash", as: :trash, via: [:get, :post]
  
end
