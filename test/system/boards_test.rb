require "application_system_test_case"

class BoardsTest < ApplicationSystemTestCase
  setup do
    @board = boards(:one)
  end

  test "visiting the index" do
    visit boards_url
    assert_selector "h1", text: "Boards"
  end

  test "should create board" do
    visit boards_url
    click_on "Add a new board"

    check "Public" if @board.public
    fill_in "Title", with: @board.title
    click_on "Create Board"

    assert_text @board.title
  end

  test "should update Board" do
    visit board_url(@board.url_id)
    click_on "Edit this board", match: :first

    check "Public" if @board.public
    fill_in "Title", with: @board.title
    click_on "Update Board"

    assert_text "Board was successfully updated"
    click_on "Back"
  end

  test "should destroy Board" do
    visit board_url(@board.url_id)
    click_on "Destroy this board", match: :first

    assert_text "Board was successfully destroyed"
  end
end
