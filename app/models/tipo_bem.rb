class TipoBem < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors

  validates :descricao, presence: true

  def self.to_dropdown
    temp = {}
    TipoBem.all.each{|x| temp = temp.merge( {x.descricao => x.id.to_i } )}
    temp
  end
end
