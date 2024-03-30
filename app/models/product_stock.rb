class ProductStock < ApplicationRecord
  # Relaciones
  belongs_to :producto

  # Validaciones
  validates :ped_cantidadDisponible, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end