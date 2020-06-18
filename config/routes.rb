Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
  end
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

namespace :admin do
    root "admins#top"  #管理者topページ
    resources :product, :except => :destroy
    resources :genres, :only => [:edit, :update, :create, :index]
    resources :customers, :only => [:edit, :update, :show, :index]
    resources :ordered_products, :only => :update
    resources :orders, :only => [:update, :show, :index]
end

#customer
    root "products#top"   #会員topページ
    get 'products/genre_products/:id' => 'products#genre_products', :action => 'genre_products'
    get "home/about" => "homes#about"  #aboutページ
    get '/customers/:id/withdrow' => 'customers#withdrow', as: 'withdrow_customer' #退会画面
    patch '/customers/:id/withdrow' => 'customers#switch', as: 'withdrow_switch_customer'  #退会処理
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all' #カートを空にする
    post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm'  #購入確認ページ
    get '/orders/thanks' => 'orders#thanks'  #注文完了後のお礼ページ(サンクスページ)
    get '/products/genre_products/:id' => 'products#genre_products', :action => 'genre_products'

    resources :customers, :only => [:show, :edit, :update]
    resources :products, :only => [:show, :index]
    resources :cart_items, :only => [:create, :update, :destroy, :index]
    resources :orders, :only => [:show, :index, :new, :create]
    resources :deliveries, :except => [:show, :new]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
