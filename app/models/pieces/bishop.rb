class Bishop < Piece
  def legal?(x, y, x_new, y_new)
  	if (y - y_new).abs == (x - x_new).abs
  		true
  	else
  		false
  	end	
  end
end