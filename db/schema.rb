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

ActiveRecord::Schema.define(version: 20160620113309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contatos", force: :cascade do |t|
    t.string   "tipo"
    t.string   "numero"
    t.integer  "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contatos", ["pessoa_id"], name: "index_contatos_on_pessoa_id", using: :btree

  create_table "desdobramentos", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "tipo_ocorrencia_id"
    t.integer  "tipo_agressor_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "tipo"
  end

  create_table "encaminhamentos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escolas", force: :cascade do |t|
    t.string   "nome"
    t.string   "cep"
    t.string   "numero"
    t.string   "email"
    t.string   "contato"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "codigo"
    t.string   "municipio"
  end

  create_table "ocorrencias", force: :cascade do |t|
    t.string   "numero_protocolo"
    t.string   "sob_influencia"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "encaminhamento_id"
    t.integer  "tipo_ocorrencia_id"
    t.integer  "tipo_agressor_id"
    t.integer  "agredido_id"
    t.integer  "agressor_id"
    t.integer  "desdobramento_tipo_ocorrencia_id"
    t.integer  "tipo_desdobramento_ocorrencia_id"
    t.integer  "desdobramento_tipo_agressor_id"
    t.integer  "tipo_desdobramento_agressor_id"
    t.date     "data_ocorrencia"
    t.time     "horario_aproximado"
    t.string   "local_ocorrencia"
    t.integer  "escola_id"
    t.integer  "user_id"
    t.text     "observacoes"
  end

  add_index "ocorrencias", ["encaminhamento_id"], name: "index_ocorrencias_on_encaminhamento_id", using: :btree
  add_index "ocorrencias", ["tipo_agressor_id"], name: "index_ocorrencias_on_tipo_agressor_id", using: :btree
  add_index "ocorrencias", ["tipo_ocorrencia_id"], name: "index_ocorrencias_on_tipo_ocorrencia_id", using: :btree

  create_table "ocorrencias_pessoas", id: false, force: :cascade do |t|
    t.integer "pessoa_id",     null: false
    t.integer "ocorrencia_id", null: false
  end

  add_index "ocorrencias_pessoas", ["ocorrencia_id", "pessoa_id"], name: "index_ocorrencias_pessoas_on_ocorrencia_id_and_pessoa_id", using: :btree
  add_index "ocorrencias_pessoas", ["pessoa_id", "ocorrencia_id"], name: "index_ocorrencias_pessoas_on_pessoa_id_and_ocorrencia_id", using: :btree

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.date     "data_nascimento"
    t.string   "sexo"
    t.string   "raca"
    t.string   "escolaridade"
    t.string   "tipo_documento"
    t.string   "numero_documento"
    t.boolean  "deficiente"
    t.string   "tipo_deficiencia"
    t.string   "nome_responsavel"
    t.string   "cep"
    t.string   "numero"
    t.string   "complemento"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "documento"
    t.string   "contato"
    t.string   "logradouro"
    t.string   "cidade"
    t.string   "bairro"
    t.string   "nome_social"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree

  create_table "tipo_agressores", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_desdobramentos", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "desdobramento_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tipo_ocorrencias", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.boolean  "ativo",                  default: true
    t.boolean  "mudar_senha",            default: true
    t.string   "cpf"
    t.integer  "escola_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["escola_id"], name: "index_users_on_escola_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contatos", "pessoas"
  add_foreign_key "ocorrencias", "encaminhamentos"
  add_foreign_key "ocorrencias", "tipo_agressores"
  add_foreign_key "ocorrencias", "tipo_ocorrencias"
  add_foreign_key "users", "escolas"
end
