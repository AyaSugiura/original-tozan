class CreateMountains < ActiveRecord::Migration[5.0]
  def change
    create_table :mountains do |t|
      t.string :name #山名
      t.integer :area　#山のエリア
      t.datetime :climbing_date #登山日
      t.string :height #山の高さ
      t.string :time #登山所要時間
      t.string :distance #歩行距離
      t.string :height_difference #高低差
      t.integer :view #眺め
      t.integer :recommend #オススメ度
      t.integer :fatigue #お疲れ度
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
