class King < Piece
  def legal?(x_new, y_new)
  	(@x - x_new).abs < 2 && (@y - y_new).abs < 2
  end
end
