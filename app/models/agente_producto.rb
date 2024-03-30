class AgenteProducto < ApplicationRecord
    # Relaciones
    belongs_to :agente
    belongs_to :producto

    # Validaciones
    validates :prod_cantidad, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :fechaSuministro, presence: true
end
