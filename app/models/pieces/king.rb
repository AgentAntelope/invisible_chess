class King < Piece
  def legal?(x, y, x_new, y_new)
  	if (x - x_new).abs < 2 && (y - y_new).abs < 2
  		true
  	end
  end
end