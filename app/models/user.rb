class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { :Ingeniero => 0, :Administrador => 1 }

  def set_role
    self.role ||= 0
  end

  validates_presence_of :first_name, :last_name, :username, :email, :id_number
  validates_length_of :first_name, :last_name, :username, minimum: 3
  validates_uniqueness_of :username, :email, :id_number
end
