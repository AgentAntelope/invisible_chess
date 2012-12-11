class Pawn < Piece

  def legal?(x_new, y_new)
    return false unless @board.legal_move?(@x, @y, x_new, y_new)
  	if @y > y_new
  		false
  	elsif (y_new - @y).abs > 2
  		false
  	elsif (x_new - @x).abs > 1
  		false
    elsif @y == y_new
      false
    elsif y_new == (@y + 2) && @y == 1
      true
  	elsif y_new - @y = 1
      true
    else 
    	false
    end  			
  end

  def taking?(x_new, y_new)
    if @x == x_new 
      false
    else
      true
    end     
  end

  def move(x_new, y_new)
    self.position unless @x && @y
    if legal?(x_new, y_new)
      if taking?(x_new, y_new)
        if @board.piece_at(x_new, y_new)
          @board.set_piece_at(x_new, y_new, self)
        else
          @board.set_piece_at(@x, @y, nil)
        end
      else
        if @board.piece_at(x_new, y_new)
          @board.set_piece_at(@x, @y, nil)
        else
          @board.set_piece_at(x_new, y_new, self)
        end
      end
      self.position
    else
      false
    end
  end
end
