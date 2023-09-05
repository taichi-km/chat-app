class Room < ApplicationRecord
  has_many :room_users,  dependent: :destroy  #roomが削除されたとき、中間テーブルも削除される
  has_many :users,      through: :room_users
  has_many :messages,  dependent: :destroy  #roomが削除されたとき、messagesテーブルも削除される

  validates :name, presence: true  #validatesメソッドを用いて、nameが空の場合はdbに保存しないというバリデーションを設定
end
