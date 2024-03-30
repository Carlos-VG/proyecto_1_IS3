class PedidoProductosController < ApplicationController
  before_action :set_pedido, only: [:create, :destroy]
  before_action :set_pedido_producto, only: [:destroy]

  # POST /pedido_productos
  def create
    @pedido_producto = @pedido.pedido_productos.new(pedido_producto_params)

    if @pedido_producto.save
      redirect_to @pedido_producto.pedido, notice: 'Producto agregado al pedido con éxito.'
    else
      redirect_to @pedido, alert: 'No se pudo agregar el producto al pedido.'
    end
  end

  # DELETE /pedido_productos/1
  def destroy
    if @pedido_producto.destroy
      notice = 'Producto eliminado del pedido con éxito.'
    else
      notice = 'No se pudo eliminar el producto del pedido.'
    end
    redirect_to @pedido_producto.pedido, notice: notice
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:pedido_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Pedido no encontrado.'
    redirect_to pedidos_path
  end

  def set_pedido_producto
    @pedido_producto = PedidoProducto.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Relación Pedido-Producto no encontrada.'
    redirect_to pedidos_path
  end
  def pedido_producto_params
    params.require(:pedido_producto).permit(:producto_id, :ped_prod_cantidad)
  end
end
