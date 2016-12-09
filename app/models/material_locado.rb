class MaterialLocado < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors
  validates :descricao, :quantidade, presence: true
  validates :quantidade, numericality: true
end
