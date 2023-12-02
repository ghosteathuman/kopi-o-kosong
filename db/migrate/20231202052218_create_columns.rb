class CreateColumns < ActiveRecord::Migration[7.1]
  def change
    create_table :columns do |t|
      t.string :title, null: false
      t.integer :position, null: false, default: 0
      t.belongs_to :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
