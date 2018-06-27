Rails.application.routes.draw do
  devise_for :users
  resources :users, path: 'u', only: %w(show), param: :username

  get 'links/minecraft' => 'links#minecraft'
  post 'links' => 'links#create'

  resources :whitelist_requests, path: 'join'
  resources :revisions
  resources :casts
  resources :conversations do
    resources :messages, module: :conversations
  end

  resources :downloads, only: %w(index)

  resources :notifications do
      collection do
        post :mark_as_read
      end
    end
  namespace :admin do
    resources :downloads
    resources :users do
      collection do
        get :email_list
        get :autocomplete
        get :whitelisted
      end
    end

    namespace :whitelist_requests, path: 'whitelist-requests' do
      resources :charts, only: %w(index)
    end
    resources :whitelist_requests, path: 'whitelist-requests' do
      collection do
        get :pending
        get :approved
        get :denied
        patch :approve
        patch :deny
        delete :destroy
      end
    end
  end

  resources :forum_threads, path: 'forum' do
   resources :forum_posts, path: 'posts', module: :forum_threads
   member do
     patch :sticky
     patch :unsticky
   end
   collection do
     get "category/:id", to: "forum_categories#index", as: :forum_category
   end
  end

  root 'pages#home'

  get '/support', :to => redirect('/subscribe')
  get 'information' => 'pages#information'
  get 'stats' => 'pages#stats'
  get '/change_log', :to => redirect('/revisions')
  get 'subscribe' => 'pages#subscribe'
  get 'servers' => 'servers#home'
  get 'servers/vanilla' => 'servers#vanilla'
  get 'servers/rrr' => 'servers#rrr'
  get 'servers/direwolf20' => 'servers#direwolf20'
  get 'servers/snapshot' => 'servers#snapshot'
end
