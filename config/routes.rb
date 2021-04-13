Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get "about" =>"homes#about",as:"about"
 resources :users,only:[:index,:show,:create,:edit,:update]
 resources :books,only:[:index,:show,:create,:edit,:update,:destroy]
end
