Rails.application.routes.draw do
  resources :images,:only => [:index,:edit,:update,:destroy] do
    collection do
      post 'search'
      get  'search'
      get  'register'
    end
    member do
      get 'show_image'
      get 'download_image'
    end
  end

  root :to => 'images#index'
end
