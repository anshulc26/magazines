Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions"}
  
  resources :articles do
    resources :comments
  end

  resources :magazines do
    resources :articles
    collection do
      get 'all_magazines'
    end
  end

  resources :comments do
    resources :comments
  end

  root 'home#index'
  get "errors/error_404" => 'errors#error_404' , as: :four_zero_four

  get '*path', to: 'errors#error_404'
end
