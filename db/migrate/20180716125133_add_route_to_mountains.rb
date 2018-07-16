class AddRouteToMountains < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :route, :string
  end
end
