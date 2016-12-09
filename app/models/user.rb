class User < ActiveRecord::Base
  include TheNotification::LocalizedErrors
  include TheRole::Api::User
  # acts_as_paranoid
  auditable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable#, :validatable

  validates :nome, :login, :email, presence: true
  validates :login, :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, on: :update

  def self.to_dropdown
    temp = {}
    User.all.order(:nome).each{|x| temp = temp.merge( {x.nome => x.id.to_i } )}
    temp
  end
end
