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
require "test_helper"

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
