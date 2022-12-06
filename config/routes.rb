Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admins,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
devise_for :customers, skip:[:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_scope :customer do
post 'customers/guest_sign_in' => 'public/sessions#guest_sign_in'
end

namespace :admin do
  resources :customers,only: [:index, :show, :edit, :update]
 end
  scope module: :public do
    get '/customers/my_page'=>"customers#show"
    get '/customers/information/edit' =>"customers#edit"
    patch '/customers/information' =>"customers#update"
    get '/customers/unsubscribe' => "customers#unsubscribe"
    patch '/customers/withdraw' => "customers#withdraw"
    get "/bookmarks" => "bookmarks#index"
    resources :post_images do
     resources :messages, only: [:create, :destroy]
     resource :bookmarks, only: [:create, :destroy]
     resources :comments, only: [:create, :destroy]
      collection do
        get "search"
        get "list"
      end
    end

    root to: "homes#top"
    get "/home/about" =>"homes#about",as:"about"
  end
   scope module: :admin do
     get "/admin" => "homes#top"
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
