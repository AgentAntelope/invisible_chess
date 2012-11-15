class Board
	attr_accessor :columns, :turn

	def initialize
		blank_board
		position_pieces(:white)
		position_pieces(:black)
		@turn = :white
	end

  def blank_board
    @columns = []
    8.times do
	    @columns << Array.new(8)
	  end
  end

  def position_pieces(colour)
  	position_pawns(colour)
  	position_rooks(colour)
  	position_knights(colour)
  	position_bishops(colour)
  	position_queen(colour)
  	position_king(colour)
  end

  def position_pawns(colour)
  	case colour
  	  when :white
  	  	(0..7).each do |i|
	  	  	@columns[i][1] = Pawn.new(:white)
  		  end
      when :black
  	  	(0..7).each do |i|
	  	  	@columns[i][6] = Pawn.new(:black)
  		  end
    end
  end

  def position_rooks(colour)
  	case colour
  	  when :white then
  	  @columns[0][0] = Rook.new(:white)
  	  @columns[7][0] = Rook.new(:white)
  	  when :black then
  	  @columns[0][7] = Rook.new(:black)
  	  @columns[7][7] = Rook.new(:black)
    end
  end

  def position_knights(colour)
  	case colour
  	  when :white then
  	  @columns[1][0] = Knight.new(:white)
  	  @columns[6][0] = Knight.new(:white)
  	  when :black then
  	  @columns[1][7] = Knight.new(:black)
  	  @columns[6][7] = Knight.new(:black)
  	end
  end

  def position_bishops(colour)
  	case colour
  	  when :white then
  	  @columns[2][0] = Bishop.new(:white)
  	  @columns[5][0] = Bishop.new(:white)
  	  when :black then
  	  @columns[2][7] = Bishop.new(:black)
  	  @columns[5][7] = Bishop.new(:black)
  	end
  end

  def position_queen(colour)
  	case colour
  	  when :white then
  	  @columns[3][0] = Queen.new(:white)
  	  when :black then
 		  @columns[3][7] = Queen.new(:black)
 		end
  end

  def position_king(colour)
  	case colour
  	  when :white then
  	  @columns[4][0] = King.new(:white)
  	  when :black then
  	  @columns[4][7] = King.new(:black)
  	end
  end

  def move(x, y, x_new, y_new)
  	if can_move?(x, y, x_new, y_new)
  		@board.columns[x_new][y_new] = @board.columns[x][y]
  	end


  end

  def next_turn
  	case @turn
    when :white then @turn = :black
    when :black then @turn = :white
    end
  end

  def can_move?(x, y, x_new, y_new)
  	if @columns[x][y].colour == @turn
	  	if x_new <= 7 && y_new <= 7 && x_new >= 0 && y_new >= 0
	  		if @columns[x_new][y_new]
		  		if @columns[x][y].colour == @columns[x_new][y_new].colour
		        false
		      else
		      	true
		      end
		    elsif @columns[x][y].legal?(x, y, x_new, y_new)
		  	  true
		    end
	  	else
	  		false
	  	end
	  else
	  	false
	  end
  end
end