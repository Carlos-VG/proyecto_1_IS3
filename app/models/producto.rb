class Producto < ApplicationRecord
    # Relaciones
    has_many :pedido_productos, dependent: :destroy
    has_many :pedidos, through: :pedido_productos
    has_many :agente_productos, dependent: :destroy
    has_many :agentes, through: :agente_productos
    has_one :product_stock, dependent: :destroy
  
    # Validaciones
    validates :prod_nombre, presence: true, length: { maximum: 50 }
    validates :prod_precio, presence: true, numericality: { greater_than: 0 }
    validates :prod_descripcion, presence: true, length: { maximum: 100 }
  end
