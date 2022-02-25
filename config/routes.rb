Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" 
  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
