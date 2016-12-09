class CentroCusto < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors

  validates :descricao, presence: true
  validates :descricao, uniqueness: { case_sensitive: false }

  def self.to_dropdown
    temp = {}
    CentroCusto.all.order(:descricao).each{|x| temp = temp.merge( {x.descricao => x.id.to_i } )}
    temp
  end
end
