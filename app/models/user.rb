class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #attr_accessor :name
  validates_uniqueness_of :auth_token

  def info
    "#{email} - #{created_at}"
  end
end
