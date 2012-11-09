class Pawn < Piece
  def legal(x_position, y_position)
  	if x_position < self.x_position
  		false
  	elsif x_position < 8 && y_position < 8
  		if self.y_position.abs - y_position.abs > 1
  			false
  		elsif self.x_position.abs - x_position.abs > 1
  			false
  		elsif self.x_position - x_position < 2
  			if self.y_position.abs - y_position.abs > 0
  				:taking = true
  				true
  			else 
  				:taking = false
  				true
  			end
  		end
    else 
    	false
    end  			
  end
end