Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
root to: 'public/homes#top'
  namespace :public do

    get 'orders/new'
    post 'orders/confirm' => '/orders/confirm'
    get 'orders/completion'
    post 'orders/create' => '/orders'
    get 'orders/index' => '/orders'
    get  'orders/:id' => 'orders#show', as: 'show_orders'
    get 'cart_items/index' => '/cart_items'
    patch 'cart_items/:id' => 'cart_items#update', as: 'update_cart_items'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_cart_items'
    delete 'cart_items/destroy_all' => '/cart_items/destroy_all'
    post 'cart_items/create' => '/cart_items'
    get 'customers/show' => '/customers/mypage'
    get 'customers/edit'
    patch 'customers/update' => '/customers'
    get 'customers/confirm'
    patch 'customers/withdrawal' => '/customers/withdrawal'
    get '/items' => 'items#index'
    get 'items/:id' => 'items#show', as: 'show_items'
    get '/' => 'homes#top'
    get 'about' => 'homes#about'
  end


  namespace :admin do


    get 'orders/:id' => 'orders#show', as: 'show_orders'
    get 'customers/index' => '/admin/customers'
    get 'customers/:id' => 'customers#show', as: 'show_customers'
    get 'customers/:id:edit' => 'customers#edit', as: 'edit_customers'
    get 'items' => 'items#index'
    get 'items/new' => '/admin/items/new'
    get 'items/:id' => 'items#show', as: 'show_items'
    get 'items/:id/edit' => 'items#edit', as: 'edit_items'
    get 'homes/top' => '/admin'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
