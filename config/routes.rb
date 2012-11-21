SupplyManagement::Application.routes.draw do
  scope "(:locale)", :locale => /en|sv/ do
    resources :categories, only: :index
    resources :suppliers
    #resources :settings, only: [:edit, :update]

    get 'settings', to: 'settings#edit'
    put 'settings', to: 'settings#update'

    root to: 'suppliers#index'

    devise_for :users
  end
end
