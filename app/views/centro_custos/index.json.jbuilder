json.array!(@centro_custos) do |centro_custo|
  json.extract! centro_custo, :id, :descricao
  json.url centro_custo_url(centro_custo, format: :json)
end
