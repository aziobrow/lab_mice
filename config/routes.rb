Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      controller :mice do
        get '/all' => :index, as: 'mice'
        get '/mouse/:original_id' => :show, as: 'mouse'
      end
    end
  end

  namespace :mice do
    controller :search do
      get '/find' => :index
    end
  end

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    delete '/logout' => :destroy
  end

  resources :users, only: [:new, :create]

end
