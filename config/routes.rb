Rails.application.routes.draw do
  get '/status', to: 'linux_printers#status'
end
