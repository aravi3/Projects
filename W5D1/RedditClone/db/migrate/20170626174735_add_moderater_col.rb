class AddModeraterCol < ActiveRecord::Migration[5.0]
  def change
    add_column :subs, :user_id, :integer, null: false
  end
end
