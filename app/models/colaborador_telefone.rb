class ColaboradorTelefone < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors
  validates_presence_of :ddd, :numero
  belongs_to :colaborador
end
