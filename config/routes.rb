Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [ :index, :show ] do
    resources :posts, only: [ :index, :new, :create, :show ] do
      resources :comments, only: [ :index, :new, :create ]
      resources :likes, only: [ :create ]
    end
    end

    namespace :api do
      namespace :v1 do
        resources :users do
          resources :posts, only: [:index] do
            resources :comments, only: [:index, :create]
          end
        end
      end
    end


    delete '/users/:user_id/posts/:post_id', to: 'posts#destroy', as: 'delete_post'
    delete '/users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_comment'

  # Defines the root path route ("/")
  # root "articles#index"

end
