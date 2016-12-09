class Fornecedor < ActiveRecord::Base
  self.table_name = 'fornecedores'
  validates_presence_of :cnpj, :razao_social
  validates_numericality_of :cnpj
end
