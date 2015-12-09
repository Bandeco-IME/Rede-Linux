Rails.application.routes.draw do
  get  'pre_signed_users/new/', to: 'pre_signed_users#new'
  get  'pre_signed_users/queue/', to: 'pre_signed_users#queue'
  get  'pre_signed_users/', to: 'pre_signed_users#index'
  post 'pre_signed_users/', to: 'pre_signed_users#create'
  delete 'pre_signed_users/:id', to: 'pre_signed_users#destroy', as: :delete
  root to: redirect('pre_signed_users/')
end
