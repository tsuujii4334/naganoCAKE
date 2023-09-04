Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    get 'orders/new'
    post 'orders/confirm' => '/orders/confirm'
    get 'orders/completion'
    post 'orders/create' => '/order'
    get  '/orders' => 'orders#index'
    get  'orders/:id' => 'orders#show', as: 'show_order'
    get 'cart_items' => 'cart_items#index'
    patch 'cart_items/:id' => 'cart_items#update', as: 'update_cart_item'
    delete 'cart_items/destroy_all' => '/cart_items/destroy_all'              #-優先順位を考慮-httpメソッドとURLが被ってる場合、idは下に書く
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_cart_item'  #-優先順位を考慮
    post 'cart_items/create' => '/cart_item'
    get 'customers/mypage' => 'customers#show', as: 'mypage_customers'
    get 'customers/edit'
    patch 'customers/update' => '/customer'
    get 'customers/confirm'
    patch 'customers/withdrawal' => '/customers/withdrawal'
    get '/items' => 'items#index'
    get 'items/:id' => 'items#show', as: 'show_items'
    get '/' => 'homes#top'
    get 'about' => 'homes#about'
  end


  namespace :admin do

    get 'homes/top' => '/admin'
    get 'orders/:id' => 'orders#show', as: 'show_order'
    get 'customers/index' => '/admin/customer'
    get 'customers/:id' => 'customers#show', as: 'show_customer'
    get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
    get 'items' => 'items#index'
    get 'items/new' => '/admin/items/new'
    post 'items/create' => 'items'
    get 'items/:id' => 'items#show', as: 'show_item'
    get 'items/:id/edit' => 'items#edit', as: 'edit_item'
    patch 'items/:id' => 'items#update', as: 'update_item'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
