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

ActiveRecord::Schema.define(version: 20160918204344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "almoxarifes", force: :cascade do |t|
    t.integer  "colaborador_id"
    t.integer  "centro_custo_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "almoxarifes", ["centro_custo_id"], name: "index_almoxarifes_on_centro_custo_id", using: :btree
  add_index "almoxarifes", ["colaborador_id"], name: "index_almoxarifes_on_colaborador_id", using: :btree

  create_table "bem_colaboradores", force: :cascade do |t|
    t.integer  "bem_id"
    t.integer  "colaborador_id"
    t.integer  "quantidade"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "bem_colaboradores", ["bem_id"], name: "index_bem_colaboradores_on_bem_id", using: :btree
  add_index "bem_colaboradores", ["colaborador_id"], name: "index_bem_colaboradores_on_colaborador_id", using: :btree

  create_table "bens", force: :cascade do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "numero_serie"
    t.string   "detalhamento"
    t.string   "observacao"
    t.money    "valor",                 scale: 2
    t.string   "nota_fiscal"
    t.string   "data_compra"
    t.integer  "situacao_id"
    t.integer  "centro_custo_id"
    t.integer  "setor_id"
    t.integer  "colaborador_id"
    t.integer  "tipo_bem_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "qtd_disponivel"
    t.integer  "grupo_insumo_id"
    t.integer  "insumo_id"
    t.integer  "estado_conservacao_id"
    t.decimal  "patrimonio"
  end

  add_index "bens", ["centro_custo_id"], name: "index_bens_on_centro_custo_id", using: :btree
  add_index "bens", ["colaborador_id"], name: "index_bens_on_colaborador_id", using: :btree
  add_index "bens", ["estado_conservacao_id"], name: "index_bens_on_estado_conservacao_id", using: :btree
  add_index "bens", ["grupo_insumo_id"], name: "index_bens_on_grupo_insumo_id", using: :btree
  add_index "bens", ["insumo_id"], name: "index_bens_on_insumo_id", using: :btree
  add_index "bens", ["setor_id"], name: "index_bens_on_setor_id", using: :btree
  add_index "bens", ["situacao_id"], name: "index_bens_on_situacao_id", using: :btree
  add_index "bens", ["tipo_bem_id"], name: "index_bens_on_tipo_bem_id", using: :btree

  create_table "bens_alocacao", force: :cascade do |t|
    t.integer  "bem_id"
    t.integer  "controle_alocacao_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "quantidade_alocada"
  end

  add_index "bens_alocacao", ["bem_id"], name: "index_bens_alocacao_on_bem_id", using: :btree
  add_index "bens_alocacao", ["controle_alocacao_id"], name: "index_bens_alocacao_on_controle_alocacao_id", using: :btree

  create_table "centro_custos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colaborador_telefones", force: :cascade do |t|
    t.string   "ddd",            limit: 5
    t.string   "numero",         limit: 20
    t.integer  "colaborador_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "colaboradores", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.integer  "funcao_id"
    t.datetime "data_admissao"
    t.datetime "data_demissao"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "data_nascimento"
  end

  add_index "colaboradores", ["funcao_id"], name: "index_colaboradores_on_funcao_id", using: :btree

  create_table "controle_alocacoes", force: :cascade do |t|
    t.datetime "data_transferencia"
    t.integer  "entregador_id"
    t.integer  "recebedor_id"
    t.integer  "centro_custo_id"
    t.integer  "tipo_alocacao_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "controle_alocacoes", ["centro_custo_id"], name: "index_controle_alocacoes_on_centro_custo_id", using: :btree
  add_index "controle_alocacoes", ["entregador_id"], name: "index_controle_alocacoes_on_entregador_id", using: :btree
  add_index "controle_alocacoes", ["recebedor_id"], name: "index_controle_alocacoes_on_recebedor_id", using: :btree
  add_index "controle_alocacoes", ["tipo_alocacao_id"], name: "index_controle_alocacoes_on_tipo_alocacao_id", using: :btree

  create_table "espinita_audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.text     "audited_changes"
    t.string   "comment"
    t.integer  "version"
    t.string   "action"
    t.string   "remote_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "espinita_audits", ["auditable_type", "auditable_id"], name: "index_espinita_audits_on_auditable_type_and_auditable_id", using: :btree
  add_index "espinita_audits", ["user_type", "user_id"], name: "index_espinita_audits_on_user_type_and_user_id", using: :btree

  create_table "estado_conservacoes", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string   "razao_social"
    t.string   "nome_fantasia"
    t.string   "telefone"
    t.string   "endereco"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cnpj",          limit: 20
  end

  create_table "funcoes", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupo_insumos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insumos", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "grupo_insumo_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "insumos", ["grupo_insumo_id"], name: "index_insumos_on_grupo_insumo_id", using: :btree

  create_table "locacao_materiais", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "locacao_id"
    t.integer  "qtd_locada"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locacao_materiais", ["locacao_id"], name: "index_locacao_materiais_on_locacao_id", using: :btree
  add_index "locacao_materiais", ["material_id"], name: "index_locacao_materiais_on_material_id", using: :btree

  create_table "locacoes", force: :cascade do |t|
    t.integer  "fornecedor_id"
    t.string   "contrato"
    t.integer  "prazo_locacao_id"
    t.date     "data_locacao"
    t.integer  "funcionario_responsavel_id"
    t.string   "valor_locacao"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "locacoes", ["fornecedor_id"], name: "index_locacoes_on_fornecedor_id", using: :btree
  add_index "locacoes", ["funcionario_responsavel_id"], name: "index_locacoes_on_funcionario_responsavel_id", using: :btree
  add_index "locacoes", ["prazo_locacao_id"], name: "index_locacoes_on_prazo_locacao_id", using: :btree

  create_table "materiais", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_locados", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "message"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prazo_locacaos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "qtd_dias"
  end

  create_table "prazo_locacoes", force: :cascade do |t|
    t.integer  "qtd_dias"
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setores", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situacoes", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_versions", force: :cascade do |t|
    t.string   "version"
    t.datetime "date_deploy"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_alocacoes", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_bens", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.string   "login"
    t.datetime "deleted_at"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios_mobiles", force: :cascade do |t|
    t.string   "login"
    t.string   "senha"
    t.integer  "colaborador_id"
    t.boolean  "super_usuario"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "usuarios_mobiles", ["colaborador_id"], name: "index_usuarios_mobiles_on_colaborador_id", using: :btree

  add_foreign_key "almoxarifes", "centro_custos"
  add_foreign_key "almoxarifes", "colaboradores"
  add_foreign_key "bem_colaboradores", "bens"
  add_foreign_key "bem_colaboradores", "colaboradores"
  add_foreign_key "bens", "centro_custos"
  add_foreign_key "bens", "colaboradores"
  add_foreign_key "bens", "estado_conservacoes"
  add_foreign_key "bens", "grupo_insumos"
  add_foreign_key "bens", "insumos"
  add_foreign_key "bens", "setores"
  add_foreign_key "bens", "situacoes"
  add_foreign_key "bens", "tipo_bens"
  add_foreign_key "bens_alocacao", "bens"
  add_foreign_key "bens_alocacao", "controle_alocacoes"
  add_foreign_key "colaboradores", "funcoes"
  add_foreign_key "controle_alocacoes", "centro_custos"
  add_foreign_key "controle_alocacoes", "colaboradores", column: "entregador_id"
  add_foreign_key "controle_alocacoes", "colaboradores", column: "recebedor_id"
  add_foreign_key "controle_alocacoes", "tipo_alocacoes"
  add_foreign_key "insumos", "grupo_insumos"
  add_foreign_key "locacao_materiais", "locacoes"
  add_foreign_key "locacao_materiais", "materiais"
  add_foreign_key "locacoes", "colaboradores", column: "funcionario_responsavel_id"
  add_foreign_key "locacoes", "fornecedores"
  add_foreign_key "locacoes", "prazo_locacoes"
  add_foreign_key "usuarios_mobiles", "colaboradores"
end
