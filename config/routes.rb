Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :shops
    resources :taxons

    root to: redirect('/admin/shops')
  end

  resources :homes
  root to: 'homes#index'
  resources :shops, param: :slug



end
