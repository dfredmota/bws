json.array!(@estado_conservacoes) do |estado_conservacao|
  json.extract! estado_conservacao, :id, :descricao
  json.url estado_conservacao_url(estado_conservacao, format: :json)
end
