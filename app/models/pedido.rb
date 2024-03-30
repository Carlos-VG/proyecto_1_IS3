class Pedido < ApplicationRecord
    # Relaciones
    has_many :pedido_productos, dependent: :destroy
    has_many :productos, through: :pedido_productos
  
    # Validaciones
    validates :clt_nombre, presence: true, length: { maximum: 100 }
    validates :clt_direccion, presence: true, length: { maximum: 150 }
    validates :ped_costo, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :ped_fecha, presence: true
  
    # Podrías querer validar el formato de la fecha aquí si tienes un formato específico en mente
  end
