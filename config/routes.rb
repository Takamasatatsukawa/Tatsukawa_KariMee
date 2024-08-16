Rails.application.routes.draw do
  # トップページのルート
  root to: 'home#top'

  resources :traps, only: [:destroy]


  # 各ページへのルート設定
  get 'hunting_map', to: 'home#hunting_ground', as: :hunting_map
  get 'hunting_info', to: 'hunting#info', as: :hunting_info
  get 'trap_info', to: 'traps#index', as: :trap_info
  get 'request_board', to: 'requests#board', as: :request_board
  get 'hunter_list', to: 'hunters#list', as: :hunter_list
  get 'event_info', to: 'events#info', as: :event_info

  # Deviseのルート
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  # ユーザー一覧ページのルートを追加
  devise_scope :user do
    get 'users', to: 'users/registrations#index', as: 'user_list'
  end

  # ヘルスチェック
  get 'up', to: 'rails/health#show', as: :rails_health_check

  resources :trap_informations, only: [:index]

  # Trapsリソースのルート
  resources :traps, only: [:create, :index, :destroy] do
    collection do
      delete '', to: 'traps#destroy', as: :delete_by_coords
    end
  end
end
