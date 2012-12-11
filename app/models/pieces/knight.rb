class Knight < Piece
  def legal?(x_new, y_new)
  	if @x = x_new || @y = y_new
  	  false
  	elsif ((@x - x_new).abs == 1 && (@y - y_new).abs == 2)
  	  true
  	elsif ((@y - y_new).abs == 1 && (@x - x_new).abs == 2)
  	  true
  	end
  end
end
