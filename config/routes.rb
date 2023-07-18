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
    get 'orders/show' => '/orders/:id'
    get 'cart_items/index' => '/cart_items'
    patch 'cart_items/update' => '/cart_items/:id'
    delete 'cart_items/destroy' => '/cart_items/:id'
    delete 'cart_items/destroy_all' => '/cart_items/destroy_all'
    post 'cart_items/create' => '/cart_items'
    get 'customers/show' => '/customers/mypage'
    get 'customers/edit'
    patch 'customers/update' => '/customers'
    get 'customers/confirm'
    patch 'customers/withdrawal' => '/customers/withdrawal'
    get 'items/index' => '/items'
    get 'items/show' => '/items/:id'
    get 'homes/top' => '/'
    get 'homes/about' => '/about'
  end
 

  namespace :admin do
   
    
    get 'orders/show' => '/admin/orders/:id'
    get 'customers/index' => '/admin/customers'
    get 'customers/show' => '/admin/customers/:id'
    get 'customers/edit' => '/admin/customers/:id:edit'
    get 'items/index' => '/admin/items'
    get 'items/new' => '/admin/items/new'
    get 'items/show' => '/admin/items/:id'
    get 'items/edit' => '/admin/items/:id/edit'
    get 'homes/top' => '/admin'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
