Rails.application.routes.draw do
  get 'finders/finder'
  namespace :public do
 end
  devise_for :admins,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
devise_for :customers, skip:[:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_scope :customer do
post 'customers/guest_sign_in' => 'customers/sessions#guest_sign_in'
end
scope module: :public do
  get '/customers/my_page'=>"customers#show"
  get '/customers/information/edit' =>"customers#edit"
  patch '/customers/information' =>"customers#update"
  get '/customers/unsubscribe' => "customers#unsubscribe"
  patch '/customers/withdraw' => "customers#withdraw"
  resources :post_images, param: :id do
    collection do
      get "search"
      get "list"
    end
  end
  resources :bookmarks, only: [:create, :show, :destroy] do
   resources :comments, only: [:create, :destroy]
  end
  resources :messages, only: [:create, :destroy]
  root to: "homes#top"
  get "/home/about" =>"homes#about",as:"about"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
