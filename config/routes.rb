Rails.application.routes.draw do
  get 'welcome/index'

  get '/status', to: 'linux_printers#status'
  get 'linux_printers/status'
end
