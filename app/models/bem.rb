class Bem < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors
  belongs_to :situacao
  belongs_to :centro_custo
  belongs_to :setor
  belongs_to :colaborador
  belongs_to :tipo_bem
  belongs_to :insumo
  belongs_to :grupo_insumo
  belongs_to :estado_conservacao

  validates :patrimonio, :modelo, :valor, :nota_fiscal, :data_compra, :situacao_id, :estado_conservacao_id, :centro_custo_id, presence: { if: Proc.new { self.tipo_bem and self.tipo_bem.descricao.downcase.eql?('patrimonio') } }#Patrimônio
  validates :patrimonio, uniqueness: { if: Proc.new { self.tipo_bem and self.tipo_bem.descricao.downcase.eql?('patrimonio') } }

  validates :valor, :nota_fiscal, :data_compra, :situacao_id, :estado_conservacao_id, :centro_custo_id, presence: { if: Proc.new { self.tipo_bem and self.tipo_bem.descricao.downcase.eql?('ferramenta') } }

  validates :valor, :nota_fiscal, :data_compra, :situacao_id, :estado_conservacao_id, :centro_custo_id, presence: { if: Proc.new { self.tipo_bem and self.tipo_bem.descricao.downcase.eql?('epi') } }

  validates :modelo, :valor, :situacao_id, :estado_conservacao_id, :centro_custo_id, presence: { if: Proc.new { self.tipo_bem and self.tipo_bem.descricao.downcase.eql?('estoque') } }

  validates :marca, presence: true

  validate :formata_patrimonio

  def self.gera_patrimonio
    pat = Bem.maximum(:patrimonio)
    pat.try(:+, 1).try(:to_i)
  end

  def formata_patrimonio
    self.patrimonio = self.patrimonio.try(:to_i) if self.patrimonio.present?
  end

  def self.to_dropdown
    temp = {}
    Bem.all.each{|x| temp = temp.merge( {x.insumo.try(:descricao) => x.id.to_i } )}
    temp
  end
end
