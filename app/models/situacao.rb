class Situacao < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors

  validates :descricao, presence: true

  def self.to_dropdown
    temp = {}
    Situacao.all.each{|x| temp = temp.merge( {x.descricao => x.id.to_i } )}
    temp
  end
end
