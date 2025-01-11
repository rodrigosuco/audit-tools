Rails.application.routes.draw do
  devise_for :users

  scope "/admin" do
    resources :users
    get 'auditors' => 'users#auditors'
  end
  resources :standards
  get "proposals/:proposal_id/items/:item_id/schedule", to: "proposals#schedule", as: "schedule_proposal_item"
  post "proposals/:proposal_id/items/:id/confirm_schedule", to: "items#confirm_schedule", as: "confirm_schedule_proposal_item"
  post "proposals/:proposal_id/items/:id/cancel_schedule", to: "items#cancel_schedule", as: "cancel_schedule_proposal_item"
  resources :proposals do
    get "auditors", on: :member
    resources :items

    member do
      get :export
      get :download
    end
  end
  root "home#index"
  resources :companies
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "*path", to: redirect('/')
end
