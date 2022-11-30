Rails.application.routes.draw do
  namespace :public do
 end
  devise_for :admins,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip:[:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  get "customers/my_page"=>"customers#show"
  get "customers/information/edit" =>"customers#edit"
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"
  root to: "homes#top"
  get "/home/about" =>"homes#about",as:"about"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
