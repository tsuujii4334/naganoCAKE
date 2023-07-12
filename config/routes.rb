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
    get 'orders/new'
    get 'orders/completion'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
    get 'items/index' => 'public/items'
    get 'items/show' => 'public/items/:id'
    get 'homes/top' => 'public/homes/'
    get 'homes/about'
  end
  
  namespace :admin do
    root to: 'homes#top'
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
