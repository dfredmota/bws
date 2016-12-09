class Almoxarife < ActiveRecord::Base
  belongs_to :colaborador
  belongs_to :centro_custo

  validates_presence_of :colaborador_id, :centro_custo_id
end
