class CreateSummits < ActiveRecord::Migration[5.0]
  def change
    create_table :summits do |t|
      t.string :image
      t.string :comment
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
