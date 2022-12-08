Rails.application.routes.draw do
  root "notes#index"
  resources :notes
  
  get "note/download", to: "notes#download", as: "download"
  post "note/delete", to: "bins#delete", as: "delete"
  get "note/trash", to: "bins#trash", as: "trash"
  get 'note/destroy', to: 'bins#destroy', as: 'destroy_bin'
  
end
