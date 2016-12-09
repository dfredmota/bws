class Locacao < ActiveRecord::Base
  belongs_to :prazo_locacao
  belongs_to :funcionario_responsavel, class_name: 'Colaborador', foreign_key: 'funcionario_responsavel_id', validate: true
  belongs_to :fornecedor
  has_many :locacao_materiais
end
