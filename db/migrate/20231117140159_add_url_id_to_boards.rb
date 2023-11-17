class AddUrlIdToBoards < ActiveRecord::Migration[7.1]
  def up
    add_column :boards, :url_id, :string, null: false
    add_index :boards, :url_id
  end

  def down
    remove_index :boards, :url_id
    remove_column :boards, :url_id, :string
  end
end
