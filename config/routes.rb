Rails.application.routes.draw do
  get 'pre-cadastro/', to: 'pre_signed_users#new'
  get 'queue/', to: 'pre_signed_users#queue'
  get 'pre_signed_users/', to: 'pre_signed_users#index'
  post 'pre_signed_users/', to: 'pre_signed_users#create'
end
