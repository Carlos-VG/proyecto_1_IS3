class CreatePedidoProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedido_productos do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :ped_prod_cantidad

      t.timestamps
    end
  end
end
