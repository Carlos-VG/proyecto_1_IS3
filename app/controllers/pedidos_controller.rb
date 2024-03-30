class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def new
    @pedido = Pedido.new
    @productos = Producto.all
    puts "Productos: #{@productos}"
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(pedido_params)

    if @pedido.save
      calcular_costo_total
      redirect_to @pedido, notice: 'Pedido creado correctamente.'
    else
      render :new
    end
  end


  def update
    @pedido = Pedido.find(params[:id])
    if @pedido.update(pedido_params)
      redirect_to @pedido, notice: 'Pedido actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy
    redirect_to pedidos_url, notice: 'Pedido eliminado con éxito.'
  end

  private

  def pedido_params
    params.require(:pedido).permit(:clt_nombre, :clt_direccion, :ped_fecha, :ped_costo)
  end

  def calcular_costo_total
    total_costo = 0

    if params[:productos].present?
      params[:productos].each do |producto_id, detalles|
        cantidad = detalles[:cantidad].to_i
        if cantidad > 0
          producto = Producto.find_by(id: producto_id)
          if producto
            costo_producto = producto.prod_precio * cantidad
            total_costo += costo_producto
            puts "Producto: #{detalles[:pedido_id].to_i}, cantidad: #{cantidad}"
            PedidoProducto.create(pedido_id: @pedido.id, producto_id: producto_id, ped_prod_cantidad: cantidad)
          end
        end
      end
    end
    @pedido.ped_costo = total_costo
    @pedido.save
  end




end
