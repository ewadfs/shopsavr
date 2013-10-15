class BoardsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.order("created_at desc").page(params[:page]).per_page(20)
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = current_user.boards.new
  end

  # GET /boards/1/edit
  def edit
    @board = current_user.boards.find(params[:id])
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = current_user.boards.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'board was successfully created.' }
        format.json { render action: 'show', status: :created, location: @board }
      else
        format.html { render action: 'new' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    @board = current_user.boards.find(params[:id])
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:description)
    end


def board_params
params.require(:board).permit(:description, :image, :image_remote_url)
end

end
