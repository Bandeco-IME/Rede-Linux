Rails.application.routes.draw do
  get 'pre_signed_users/new', to: 'pre_signed_users#new'
  get 'pre_signed_users/queue', to: 'pre_signed_users#queue'
  get 'pre_signed_users/', to: 'pre_signed_users#index'
  post 'pre_signed_users', to: 'pre_signed_users#create'
  root to: redirect('pre-signup/pre_signed_users/')
end
