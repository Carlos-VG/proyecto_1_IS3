class AgenteProductosController < ApplicationController

  def new
    @agentes = Agente.all
    @productos = Producto.all
  end

  def create
    # Verificar si se recibió el parámetro :agente_id
    if params[:agente_id].blank?
      redirect_to root_path, alert: 'El ID del agente es requerido.'
      return
    end

    # Verificar si se recibieron los parámetros :productos
    if params[:productos].blank?
      redirect_to root_path, alert: 'La información de productos es requerida.'
      return
    end

    agente_id = params[:agente_id]
    productos_params = params[:productos]

    begin
      # Iterar sobre los productos suministrados
      productos_params.each do |producto_id, detalles|
        cantidad = detalles[:cantidad].to_i
        next if cantidad <= 0

        # Crear registro de AgenteProducto
        AgenteProducto.create!(
          producto_id: producto_id,
          agente_id: agente_id,
          prod_cantidad: cantidad,
          fechaSuministro: Time.now
        )
        productostockantiguo = ProductStock.find_by(producto_id: producto_id)
        cantidadantigua= productostockantiguo.ped_cantidadDisponible
        ProductStock.update(producto_id:producto_id, ped_cantidadDisponible: cantidad+cantidadantigua)
      end

      # Redireccionar con mensaje de éxito
      redirect_to root_path, notice: 'Productos suministrados con éxito.'
    rescue => e
      # Manejar errores durante la creación de registros
      redirect_to root_path, alert: "Error al suministrar productos: #{e.message}"
    end
  end

end
