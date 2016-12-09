json.array!(@insumos) do |insumo|
  json.extract! insumo, :id, :descricao, :grupo_insumo_id
  json.url insumo_url(insumo, format: :json)
end
