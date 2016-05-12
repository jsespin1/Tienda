# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160512151257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "promocion_id"
    t.integer  "order_id"
    t.integer  "precio_unitario"
    t.integer  "cantidad"
    t.integer  "precio_total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree
  add_index "order_items", ["promocion_id"], name: "index_order_items_on_promocion_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.integer  "order_status_id"
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "precio"
    t.boolean  "active"
    t.text     "descripcion"
    t.string   "imagen"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products_promocions", force: :cascade do |t|
    t.integer "product_id"
    t.integer "promocion_id"
  end

  create_table "promocions", force: :cascade do |t|
    t.integer  "subtotal"
    t.integer  "descuento"
    t.string   "nombre"
    t.text     "comentario"
    t.boolean  "active"
    t.string   "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "nombre"
    t.string   "apellido",           default: ""
    t.boolean  "admin"
    t.string   "direccion",          default: ""
    t.string   "comuna",             default: ""
    t.string   "pais",               default: ""
    t.boolean  "bloqueado",          default: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "promocions"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "users"
end
