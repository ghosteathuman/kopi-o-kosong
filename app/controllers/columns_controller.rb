class ColumnsController < ApplicationController
  before_action :set_column, only: %i[ show edit update destroy ]

  # GET /columns
  def index
    @columns = Column.all
  end

  # GET /columns/1
  def show
  end

  # GET /columns/new
  def new
    @column = Column.new
  end

  # GET /columns/1/edit
  def edit
  end

  # POST /columns
  def create
    @column = Column.new(column_params)

    if @column.save
      redirect_to @column, notice: "Column was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /columns/1
  def update
    if @column.update(column_params)
      redirect_to @column, notice: "Column was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /columns/1
  def destroy
    @column.destroy!
    redirect_to columns_url, notice: "Column was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def column_params
      params.require(:column).permit(:title, :position, :board_id)
    end
end
