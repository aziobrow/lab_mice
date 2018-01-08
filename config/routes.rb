Rails.application.routes.draw do
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      controller :mice do
        get '/mice/all' => :index, as: 'mice'
        get '/mouse/:original_id' => :show, as: 'mouse'
      end

      namespace :mice do
        controller :search do
          get '/find' => :index
        end
      end

    end
  end

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    get '/auth/google_oauth2/callback' => :create
    delete '/logout' => :destroy
  end

  controller :dashboard do
    get '/dashboard' => :show, as: 'user_dashboard'
  end

  resources :users, only: [:new, :create]

  resources :mice, only: [:index, :show]

  resources :tracked_subjects, only: [:create, :destroy]
end
