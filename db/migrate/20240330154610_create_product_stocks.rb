class CreateProductStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :product_stocks do |t|
      t.references :producto, null: false, foreign_key: true
      t.integer :ped_cantidadDisponible

      t.timestamps
    end
  end
end
