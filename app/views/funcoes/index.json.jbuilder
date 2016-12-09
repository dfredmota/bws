json.array!(@funcoes) do |funcao|
  json.extract! funcao, :id, :descricao
  json.url funcao_url(funcao, format: :json)
end
