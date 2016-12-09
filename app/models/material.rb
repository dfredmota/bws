class Material < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors
  validates :descricao, :quantidade, presence: true
  validates :quantidade, numericality: true
  has_many :locacao_materiais
end
