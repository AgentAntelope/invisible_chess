class Knight < Piece
  def legal?(x_new, y_new)
  	return false unless @board.legal_move?(@x, @y, x_new, y_new)
    ((@x - x_new).abs == 1 && (@y - y_new).abs == 2) || ((@y - y_new).abs == 1 && (@x - x_new).abs == 2)
  end
end
