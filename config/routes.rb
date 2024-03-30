Rails.application.routes.draw do

  get 'agente_productos/new', to: 'agente_productos#new', as: 'new_agente_producto'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Rutas para Pedido
  resources :pedidos do
    # Rutas anidadas para Productos dentro de un Pedido
    resources :productos
  end
  
  # Rutas para Producto
  resources :productos do
    # Ruta anidada para manejar el stock de un Producto
    resource :stock # 'resource' es singular ya que podrías tener un único stock por producto
    # Rutas anidadas para manejar Proveedores de un Producto
    resources :agentes
  end

  # Rutas para Proveedor
  resources :agentes do
    # Rutas anidadas para manejar Productos suministrados por un Proveedor
    resources :productos
  end

  # Rutas para PedidoProducto y ProveedorProducto si necesitas manipular estas relaciones directamente
  resources :pedido_productos
  resources :agente_productos, only: [:new, :create]

  # Ruta para ProductStock si necesitas rutas no anidadas para manejar el stock
  resources :product_stocks

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "home#index"
end
