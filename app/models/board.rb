# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  public     :boolean          default(FALSE)
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url_id     :string           not null
#
# Indexes
#
#  index_boards_on_url_id  (url_id)
#
class Board < ApplicationRecord
  after_initialize :set_url_id

  has_many :columns, dependent: :delete_all

  scope :ordered, -> { order(id: :desc) }

  private

  def set_url_id
    self.url_id ||= SecureRandom.urlsafe_base64
  end
end
