class Bishop < Piece
  def legal?(x_new, y_new)
    return false unless @board.legal_move?(@x, @y, x_new, y_new)
  	(@y - y_new).abs == (@x - x_new).abs
  end
end
