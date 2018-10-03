class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :proposals

  validates :name, :document, :phone, presence: true
  has_many :proposals  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
