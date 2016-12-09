json.array!(@fornecedores) do |fornecedor|
  json.extract! fornecedor, :id, :razao_social, :nome_fantasia, :telefone, :endereco, :email
  json.url fornecedor_url(fornecedor, format: :json)
end
