class DropremoveColumnUserIdToGroups < ActiveRecord::Migration[7.0]
  def change
    drop_table :remove_column_user_id_to_groups
  end
end
