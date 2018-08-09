class AddSummitNumberToSummits < ActiveRecord::Migration[5.0]
  def change
    add_column :summits, :summitNumber, :integer
  end
end
