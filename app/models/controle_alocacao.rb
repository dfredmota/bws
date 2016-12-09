class ControleAlocacao < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors
  belongs_to :entregador, class_name: 'Colaborador', foreign_key: 'entregador_id', validate: true
  belongs_to :recebedor, class_name: 'Colaborador', foreign_key: 'recebedor_id', validate: true
  belongs_to :centro_custo
  belongs_to :tipo_alocacao
  has_many :bens_alocacao
end
