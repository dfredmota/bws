json.array!(@usuarios_mobiles) do |usuarios_mobile|
  json.extract! usuarios_mobile, :id, :login, :senha, :colaborador_id, :super_usuario
  json.url usuarios_mobile_url(usuarios_mobile, format: :json)
end
