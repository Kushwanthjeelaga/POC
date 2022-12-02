Rails.application.routes.draw do
  root "notes#index"
  resources :notes
  post "note/delete", to: "bins#delete", as: "delete"
  get "note/trash", to: "bins#trash", as: "trash"
  
end
