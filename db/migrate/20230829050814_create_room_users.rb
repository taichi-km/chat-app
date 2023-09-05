class CreateRoomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_users do |t|
      t.references :user, null: false, foreign_key: true   #references型は外部キーのカラムを追加する際に用いる
      t.references :room, null: false, foreign_key: true   #foreign_key:trueを記述して外部キーがないとdbに保存できないようにする
      t.timestamps
    end
  end
end
