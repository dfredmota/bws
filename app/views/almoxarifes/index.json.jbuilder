json.array!(@almoxarifes) do |almoxarife|
  json.extract! almoxarife, :id, :colaborador_id, :centro_custo_id
  json.url almoxarife_url(almoxarife, format: :json)
end
