class PedidoProducto < ApplicationRecord
  # Relaciones
  belongs_to :pedido
  belongs_to :producto

  # Validaciones
  validates :ped_prod_cantidad, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
