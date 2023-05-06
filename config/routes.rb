Rails.application.routes.draw do
  get 'pastimes/top' => 'pastimes#top'
  get 'pastimes/suports' => 'pastimes#suports'
  get 'pastimes/kansens' => 'pastimes#kansens'
  get 'pastimes/travels' => 'pastimes#travels'
  get 'pastimes/gurumes' => 'pastimes#gurumes'
  get 'pastimes/cooks' => 'pastimes#cooks'
  get 'pastimes/outdoor' => 'pastimes#outdoor'
  get 'pastimes/makes' => 'pastimes#makes'
  get 'pastimes/sodaterus' => 'pastimes#sodaterus'
  get 'pastimes/musics' => 'pastimes#musics'
  get 'pastimes/arts' => 'pastimes#arts'
  get 'pastimes/dances' => 'pastimes#dances'
  get 'pastimes/games' => 'pastimes#games'
  get 'pastimes/entames' => 'pastimes#entames'
  get 'pastimes/gyanbuls' => 'pastimes#gyanbuls'
  get 'pastimes/biyous' => 'pastimes#biyous'
  get 'pastimes/studies' => 'pastimes#studies'
  get 'pastimes/earns' => 'pastimes#earns'
  get 'pastimes/collections' => 'pastimes#collections'
  get 'pastimes/volunteers' => 'pastimes#volunteers'
  get 'pastimes/others' => 'pastimes#others'


  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :pastimes do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create]

   
  end
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :shindans

  root 'pastimes#index'


end
