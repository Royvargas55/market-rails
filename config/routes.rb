Rails.application.routes.draw do
  root 'welcome#index'

  # scope "/orders" do
  #   get'/all-active-orders', to: 'orders#all_active_orders', as: "all_active_orders"
  #   get'/all-complete-orders', to: 'orders#all_complete_orders', as: "all_complete_orders"
  # end

  devise_for :users
  resources :categories do
    resources :orders, except: [:index] do
      member do
        put :boss_approved
        put :boss_disapproved
        put :financial_approved
        put :financial_disapproved
      end
    end
  end
  resources :users do
    member do
      put :boss_approved
      put :boss_disapproved
      put :financial_approved
      put :financial_disapproved
    end
  end
  resources :orders


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
