Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/completion'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end
  namespace :public do
    get 'sessions/new'
  end
  namespace :public do
    get 'registrations/new'  #device関係の指定があるため調べなおす
  end
  namespace :public do
    get 'items/index' => 'public/items'
    get 'items/show' => 'public/items/:id'
  end
  namespace :public do
    get 'homes/top' => 'public/homes/'
    get 'homes/about'
  end
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
