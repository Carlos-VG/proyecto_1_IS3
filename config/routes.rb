Rails.application.routes.draw do
  get 'agente_productos/new', to: 'agente_productos#new', as: 'new_agente_producto'
  post 'agente_productos', to: 'agente_productos#create' # Nueva ruta para el método create

  resources :pedidos do
    resources :productos
  end

  resources :productos do
    resource :stock
    resources :agentes
  end

  resources :agentes do
    resources :productos
  end

  resources :pedido_productos
  resources :agente_productos, only: [:new, :create]

  resources :product_stocks

  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"
end
