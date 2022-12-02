class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[:engineer, :admin, :manager, :regular]
  def set_role
    self.role ||= :regular
  end


  validates_presence_of :first_name, :last_name, :username, :email, :id_number
  validates_length_of :first_name, :last_name, :username, minimum: 3
  validates_uniqueness_of :username, :email, :id_number
end
