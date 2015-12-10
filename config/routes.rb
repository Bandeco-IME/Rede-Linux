Rails.application.routes.draw do
  get  'pre_signed_users/new/', to: 'pre_signed_users#new', as: :pre_signed_users_new
  get  'pre_signed_users/queue/', to: 'pre_signed_users#queue', as: :pre_signed_users_queue
  get  'pre_signed_users/:id', to: 'pre_signed_users#destroy', as: :pre_signed_users_delete
  post 'pre_signed_users/', to: 'pre_signed_users#create', as: :pre_signed_users
  get  'printer/status', to: 'printer#status', as: :printer_status
  get  'rede_linux/about', to: 'welcome#about', as: :welcome_about
  get  'rede_linux/hour', to: 'welcome#hour', as: :welcome_hour
  get  'rede_linux/contact', to: 'welcome#contact', as: :welcome_contact
  get  'rede_linux/old_adm', to: 'welcome#old_adm', as: :welcome_old_adm
  get  'rede_linux/rules', to: 'welcome#rules', as: :welcome_rules

  root to: redirect('rede_linux/about')
end
