# == Schema Information
#
# Table name: columns
#
#  id         :bigint           not null, primary key
#  position   :integer          default(0), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_columns_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
class Column < ApplicationRecord
  belongs_to :board

  scope :ordered, -> { order(position: :asc) }
end
