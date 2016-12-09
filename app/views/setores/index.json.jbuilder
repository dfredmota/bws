json.array!(@setores) do |setor|
  json.extract! setor, :id, :descricao
  json.url setor_url(setor, format: :json)
end
