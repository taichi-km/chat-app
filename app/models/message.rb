class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: :true, unless: :was_attached?
  #画像がなければテキストが必要となり、画像があればテキストは不要になる

  def was_attached?
    self.image.attached?  #画像があればtrue,画像がなければfalse
  end
end
