# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_30_154610) do
  create_table "agente_productos", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "agente_id", null: false
    t.integer "prod_cantidad"
    t.datetime "fechaSuministro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agente_id"], name: "index_agente_productos_on_agente_id"
    t.index ["producto_id"], name: "index_agente_productos_on_producto_id"
  end

  create_table "agentes", force: :cascade do |t|
    t.string "agen_nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedido_productos", force: :cascade do |t|
    t.integer "pedido_id", null: false
    t.integer "producto_id", null: false
    t.integer "ped_prod_cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_pedido_productos_on_pedido_id"
    t.index ["producto_id"], name: "index_pedido_productos_on_producto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "clt_nombre"
    t.string "clt_direccion"
    t.decimal "ped_costo"
    t.date "ped_fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_stocks", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "ped_cantidadDisponible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_product_stocks_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "prod_nombre"
    t.decimal "prod_precio"
    t.text "prod_descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agente_productos", "agentes"
  add_foreign_key "agente_productos", "productos"
  add_foreign_key "pedido_productos", "pedidos"
  add_foreign_key "pedido_productos", "productos"
  add_foreign_key "product_stocks", "productos"
end
