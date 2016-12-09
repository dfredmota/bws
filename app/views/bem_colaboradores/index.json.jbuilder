json.array!(@bem_colaboradores) do |bem_colaborador|
  json.extract! bem_colaborador, :id, :bem_id, :colaborador_id, :quantidade
  json.url bem_colaborador_url(bem_colaborador, format: :json)
end
