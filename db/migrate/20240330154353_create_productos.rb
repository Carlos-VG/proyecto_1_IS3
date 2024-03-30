class CreateProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :productos do |t|
      t.string :prod_nombre
      t.decimal :prod_precio
      t.text :prod_descripcion

      t.timestamps
    end
  end
end
