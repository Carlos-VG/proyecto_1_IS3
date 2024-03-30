class Agente < ApplicationRecord
    # Relaciones
    has_many :agente_productos, dependent: :destroy
    has_many :productos, through: :agente_productos

    # Validaciones
    validates :agen_nombre, presence: true, length: { maximum: 50 }
end
