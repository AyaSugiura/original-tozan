class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.string :content
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
