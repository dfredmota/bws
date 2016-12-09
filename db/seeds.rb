# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Usuario
User.create!(id: 1,email: 'admin@admin.com',nome: 'Admin',login: 'admin',password: '2w3e#E@W',password_confirmation: '2w3e#E@W');
# rake db:the_role:admin
# User.first.update( role: Role.with_name(:admin) )

## Funcoes
Funcao.create(descricao: 'Gerente')
Funcao.create(descricao: 'Mestre de Obras')
Funcao.create(descricao: 'Diretor')
Funcao.create(descricao: 'Auxiliar')
Funcao.create(descricao: 'Almoxarife')

TipoBem.create(descricao: 'Ferramenta')
TipoBem.create(descricao: 'EPI')
TipoBem.create(descricao: 'Patrimônio')

