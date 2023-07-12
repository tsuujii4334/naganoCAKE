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
    get 'orders/show'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
    get 'homes/top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
