class CreateRoomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_users do |t|
      t.references :user, null: false, foreign_key: true   #references型は外部キーのカラムを追加する際に用いる
      t.references :room, null: false, foreign_key: true   #foreign: trueを記述して外部キーの制約を設定する
      t.timestamps
    end
  end
end
