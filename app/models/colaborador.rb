class Colaborador < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors
  belongs_to :funcao
  has_many :telefones, class_name: 'ColaboradorTelefone', dependent: :restrict_with_error
  validates_presence_of :nome, :cpf, :data_admissao, :data_nascimento, :funcao_id
  accepts_nested_attributes_for :telefones, reject_if: proc { |attributes| attributes['numero'].blank? }, allow_destroy: true

  def self.to_dropdown
    temp = {}
    Colaborador.all.order(:nome).each{|x| temp = temp.merge( {x.nome => x.id.to_i } )}
    temp
  end

end
