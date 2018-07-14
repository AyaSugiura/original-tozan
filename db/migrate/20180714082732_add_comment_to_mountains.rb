class AddCommentToMountains < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :comment, :text
  end
end
