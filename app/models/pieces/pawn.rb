class Pawn < Piece
  attr_accessor :taking

  def legal?(x, y, x_new, y_new)
  	if y > y_new
  		false
  	elsif (y_new - y).abs > 2
  		false
  	elsif (x_new - x).abs > 1
  		false
    elsif y_new == (y + 2)
      #add en passant
      true
      @taking = false
  	elsif y_new - y = 1
  		if (x - x_new).abs > 0
  			@taking = true
  			true
  		else 
  			@taking = false
  			true
  		end
    else 
    	false
    end  			
  end
end