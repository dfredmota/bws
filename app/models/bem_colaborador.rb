class BemColaborador < ActiveRecord::Base
  belongs_to :bem
  belongs_to :colaborador

  validates :bem_id, :colaborador_id, :quantidade, presence: true
end
