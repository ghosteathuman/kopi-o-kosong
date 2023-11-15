class Board < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
end
