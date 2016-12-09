# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.plural(/$/,  's')
  inflect.irregular('funcao', 'funcoes')
  inflect.irregular('colaborador', 'colaboradores')
  inflect.irregular('setor', 'setores')
  inflect.irregular('situacao', 'situacoes')
  inflect.irregular('bem', 'bens')
  inflect.irregular('locacao', 'locacoes')
  inflect.irregular('controle_alocacao', 'controle_alocacoes')
  inflect.irregular('tipo_alocacao', 'tipo_alocacoes')
  inflect.irregular('bem_alocacao', 'bens_alocacao')
  inflect.irregular('fornecedor', 'fornecedores')
  # inflect.irregular('locacao_material', 'locacao_materiais')
  inflect.irregular('prazo_locacao', 'prazo_locacoes')
  inflect.irregular('material', 'materiais')
  inflect.irregular('estado_conservacao', 'estados_conservacao')
  inflect.irregular('conservacao', 'conservacoes')
end
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
