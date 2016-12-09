json.array!(@grupo_insumos) do |grupo_insumo|
  json.extract! grupo_insumo, :id, :descricao
  json.url grupo_insumo_url(grupo_insumo, format: :json)
end
