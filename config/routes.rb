Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: 'search#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      controller :mice do
        get '/mice/all' => :index, as: 'mice'
        get '/mouse/:lab_id' => :show, as: 'mouse'
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

  controller :tracked_subjects do
    post '/tracked_subjects' => :create
    delete '/tracked_subjects/:lab_id' => :destroy, as: 'tracked_subject'
  end

  controller :dashboard do
    get '/dashboard' => :index, as: 'user_dashboard'
    get '/analytics' => :show, as: 'user_analytics'
  end

  controller :filter do
    get '/filter' => :index, as: 'filter'
  end

  resources :users, only: [:new, :create]

  resources :mice, only: [:index, :show, :new, :create, :edit, :update]

  resources :notes, only: [:create]

end
