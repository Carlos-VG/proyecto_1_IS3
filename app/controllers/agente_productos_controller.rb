class AgenteProductosController < ApplicationController

  def new
    @agentes = Agente.all
    @productos = Producto.all
  end

  def create
    agente_id = params[:agente_id]
    productos_params = params[:productos]

    productos_params.each do |producto_id, detalles|
      cantidad = detalles[:cantidad].to_i
      next if cantidad <= 0  # Salta el producto si la cantidad es 0 o negativa

      AgenteProducto.create(
        agente_id: agente_id,
        producto_id: producto_id,
        prod_cantidad: cantidad,
        fechaSuministro: Time.now  # Ajusta esto según cómo quieras manejar la fecha
      )
    end

    # Redireccionar a algún lado, por ejemplo, de vuelta a la página de nuevo registro
    redirect_to new_agente_producto_path, notice: 'Productos suministrados con éxito.'
  end
end
