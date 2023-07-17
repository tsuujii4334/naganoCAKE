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

  namespace :public do
    root to: 'homes#top'
    get 'orders/new'
    get 'orders/completion'
    get 'orders/index' => 'orders'
    get 'orders/show' => 'orders/:id'
    get 'cart_items/index' => 'cart_items'
    get 'customers/show' => 'customers/mypage'
    get 'customers/edit'
    get 'customers/confirm'
    get 'items/index' => 'public/items'
    get 'items/show' => 'public/items/:id'
    get 'homes/top' => 'public/homes/'
    get 'homes/about'
  end
 

  namespace :admin do
   
    
    get 'orders/show' => 'orders/:id'
    get 'customers/index' => 'customers'
    get 'customers/show' => 'customers/:id'
    get 'customers/edit' => 'customers/:id:edit'
    get 'items/index' => 'items'
    get 'items/new' => 'items/new'
    get 'items/show' => 'items/:id'
    get 'items/edit' => 'items/:id/edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
