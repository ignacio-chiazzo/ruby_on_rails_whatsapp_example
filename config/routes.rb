Rails.application.routes.draw do
  resources :messages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "whatsapp_webhooks#index"
  get "/whatsapp_webhooks", to: "whatsapp_webhooks#index"
  post "/whatsapp_webhooks", to: "whatsapp_webhooks#receive_webhook"
  get "/", to: "messages#index"
  get "/messages", to: "messages#index"
end

