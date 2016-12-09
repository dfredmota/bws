json.array!(@materiais) do |material|
  json.extract! material, :id, :descricao, :quantidade
  json.url material_url(material, format: :json)
end
