class CreateAgenteProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :agente_productos do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :agente, null: false, foreign_key: true
      t.integer :prod_cantidad
      t.datetime :fechaSuministro

      t.timestamps
    end
  end
end
