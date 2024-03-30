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
    @pedido.ped_costo=0
    puts "Creando pedido..."
    respond_to do |format|
      if @pedido.save
        puts"Pedido guardado"
        calcular_costo_total
        format.html { redirect_to @pedido, notice: 'Pedido creado correctamente.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        puts "Error al guardar pedido"
        puts @pedido.errors.full_messages.inspect
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
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
    total_costo = calcular_total_costo_productos(params[:productos])
    actualizar_pedido_con_costo_total(total_costo)
  end

  def calcular_total_costo_productos(productos_params)
    total_costo = 0

    if productos_params.present?
      productos_params.each do |producto_id, detalles|
        cantidad = detalles[:cantidad].to_i
        next unless cantidad.positive?

        producto = Producto.find_by(id: producto_id)
        next unless producto

        costo_producto = calcular_costo_producto(producto.prod_precio, cantidad)
        total_costo += costo_producto
        crear_pedido_producto(@pedido.id, producto_id, cantidad)
      end
    end

    total_costo
  end

  def calcular_costo_producto(precio_unitario, cantidad)
    precio_unitario * cantidad
  end

  def crear_pedido_producto(pedido_id, producto_id, cantidad)
    PedidoProducto.create(pedido_id: pedido_id, producto_id: producto_id, ped_prod_cantidad: cantidad)
  end

  def actualizar_pedido_con_costo_total(total_costo)
    @pedido.ped_costo = total_costo
    @pedido.save
  end




end
