Rails.application.routes.draw do
  get  'rede_linux/', to: 'welcome#index'
  get  'pre_signed_users/new/', to: 'pre_signed_users#new', as: :pre_signed_users_new
  get  'pre_signed_users/queue/', to: 'pre_signed_users#queue', as: :pre_signed_users_queue
  get  'pre_signed_users/:id', to: 'pre_signed_users#destroy', as: :pre_signed_users_delete
  post 'pre_signed_users/', to: 'pre_signed_users#create', as: :pre_signed_users
  get  'printer/status', to: 'printer#status', as: :printer_status

  root to: redirect('rede_linux/')
end
