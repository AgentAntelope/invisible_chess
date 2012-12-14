class Piece
	attr_accessor :colour, :board, :x, :y

	def initialize(colour, board)
    @colour = colour
    @board = board
  end

  def legal?(x_new, y_new)
  	@board.legal_move?(@x, @y, x_new, y_new)
  end

  def move(x_new, y_new)
    self.position unless @x && @y
    if legal?(x_new, y_new)
      @board.set_piece_at(x_new, y_new, self)
      @board.delete_piece_at(@x, @y)
      @x = x_new
      @y = y_new
      @board.next_turn
      true
    else
      false
    end
  end
  
  def position
    @board.columns.each_with_index do |column, i|
      @x = i
      @y = column.index(self)
      return if @y
    end
  end

  def taking?
    true
  end
end
