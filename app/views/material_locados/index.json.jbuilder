json.array!(@material_locados) do |material_locado|
  json.extract! material_locado, :id, :descricao, :quantidade
  json.url material_locado_url(material_locado, format: :json)
end
