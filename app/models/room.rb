class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages

  validates :names, presence: :true  #validatesメソッドを用いて、nameが空の場合はdbに保存しないというバリデーションを設定

end
