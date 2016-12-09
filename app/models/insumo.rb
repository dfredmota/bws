class Insumo < ActiveRecord::Base
  belongs_to :grupo_insumo
  validates :descricao, :grupo_insumo_id, presence: true
  validates :descricao, uniqueness: { case_sensitive: false }

  before_validation :strip_whitespace

  def strip_whitespace
    self.descricao = self.descricao.strip unless self.descricao.nil?
  end

  def self.to_dropdown
    temp = {}
    Insumo.all.order(:descricao).each{|x| temp = temp.merge( {x.descricao => x.id.to_i } )}
    temp
  end

end
