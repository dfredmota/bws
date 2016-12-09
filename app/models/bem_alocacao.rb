class BemAlocacao < ActiveRecord::Base
  auditable
  include TheNotification::LocalizedErrors

  belongs_to :bem
  belongs_to :controle_alocacao
end
