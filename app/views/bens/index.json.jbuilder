json.array!(@bens) do |bem|
  json.extract! bem, :id, :grupo_insumo, :insumo, :marca, :modelo, :numero_serie, :detalhamento, :observacao, :valor, :nota_fiscal, :data_compra, :situacao_id, :estado_conservacao, :centro_custo_id, :setor_id, :colaborador_id, :tipo_bem_id
  json.url bem_url(bem, format: :json)
end
