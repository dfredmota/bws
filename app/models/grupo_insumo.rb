class GrupoInsumo < ActiveRecord::Base
  validates :descricao, presence: true
  validates :descricao, uniqueness: { case_sensitive: false }
  before_validation :strip_whitespace

  def strip_whitespace
    self.descricao = self.descricao.strip unless self.descricao.nil?
  end

  def self.to_dropdown
    temp = {}
    GrupoInsumo.all.order(:descricao).each{|x| temp = temp.merge( {x.descricao => x.id.to_i } )}
    temp
  end
end
