class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.string :clt_nombre
      t.string :clt_direccion
      t.decimal :ped_costo
      t.date :ped_fecha

      t.timestamps
    end
  end
end
