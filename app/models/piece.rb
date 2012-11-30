class Piece
	attr_accessor :colour, :board

	def initialize(colour, board = nil)
    @colour = colour
    @board = board
  end

  def legal?(x, y, x_new, y_new)
  	@board.legal_move?(x, y, x_new, y_new)
  end

  def taking?(x, y, x_new, y_new)
    true
  end

  def move(x, y, x_new, y_new)
    if legal?(x, y, x_new, y_new)
      @board.set_piece_at(x_new, y_new, self)
      @board.set_piece_at(x, y, nil)
      @board.preserve_current_board
    else
      false
    end
  end
end