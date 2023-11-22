class BoardsController < ApplicationController
  before_action :set_board, only: %i[update]
  before_action :set_board_by_url_id, only: %i[show edit destroy]

  # GET /boards
  def index
    @boards = Board.ordered
  end

  # GET /boards/url_id
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/url_id/edit
  def edit
  end

  # POST /boards
  def create
    @board = Board.new(board_params)

    if @board.save
      # redirect_to @board, notice: "Board was successfully created."
      respond_to do |format|
        format.html { redirect_to boards_path, notice: "Board was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      redirect_to board_path(@board.url_id), notice: "Board was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy!
    redirect_to boards_url, notice: "Board was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  def set_board_by_url_id
    @board = Board.find_by(url_id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:title, :public)
  end
end
