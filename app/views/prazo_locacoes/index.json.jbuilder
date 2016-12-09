json.array!(@prazo_locacaos) do |prazo_locacao|
  json.extract! prazo_locacao, :id, :descricao
  json.url prazo_locacao_url(prazo_locacao, format: :json)
end
