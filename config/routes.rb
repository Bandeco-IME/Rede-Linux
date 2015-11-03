Rails.application.routes.draw do
  get 'pre_signed_users/new'
  
  root 'welcome#index'
  
  get '/precadastro', to: 'pre_signed_users#new'
  get '/fila', to: 'pre_signed_users#show'

  # get '/status', to: 'linux_printers#status'
  # get 'linux_printers/status'
end
