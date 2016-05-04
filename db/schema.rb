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


ActiveRecord::Schema.define(version: 20160503231552) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "nombre"
    t.string   "apellido",           default: ""
    t.boolean  "admin",              default: false
    t.string   "direccion",          default: ""
    t.string   "comuna",             default: ""
    t.string   "pais",               default: ""
<<<<<<< HEAD
    t.boolean  "bloqueado",          default: false
=======

>>>>>>> 2c4000bdde04b8aebc2ecb7bc51644dfcf2d8cb3
  end

end
