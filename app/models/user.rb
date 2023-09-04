class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true  #validatesメソッドを用いて、nameが空の場合はdbに保存しないというバリデーションを設定

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  
end
