json.array!(@colaboradores) do |colaborador|
  json.extract! colaborador, :id, :nome, :cpf, :data_nascimento, :funcao_id, :data_admissao, :data_demissao, :deleted_at
  json.url colaborador_url(colaborador, format: :json)
end
