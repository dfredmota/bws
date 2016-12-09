class LocacaoMaterial < ActiveRecord::Base
  belongs_to :material
  belongs_to :locacao
end
