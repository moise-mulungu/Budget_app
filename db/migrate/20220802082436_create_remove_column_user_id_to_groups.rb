class CreateRemoveColumnUserIdToGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :remove_column_user_id_to_groups do |t|

      t.timestamps
    end
  end
end
