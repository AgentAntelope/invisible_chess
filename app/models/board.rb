class Board
	attr_accessor :columns, :turn, :taken, :size

	def initialize(size = 8)
		blank_board
		position_pieces(:white)
		position_pieces(:black)
		@turn = :white
    @taken = []
    @size = size
	end

  def blank_board(size = 8)
    @columns = []
    size.times do
	    @columns << Array.new(size)
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
	  	  	@columns[i][1] = Pawn.new(:white, self)
  		  end
      when :black
  	  	(0..7).each do |i|
	  	  	@columns[i][6] = Pawn.new(:black, self)
  		  end
    end
  end

  def position_rooks(colour)
  	case colour
  	  when :white then
  	  @columns[0][0] = Rook.new(:white, self)
  	  @columns[7][0] = Rook.new(:white, self)
  	  when :black then
  	  @columns[0][7] = Rook.new(:black, self)
  	  @columns[7][7] = Rook.new(:black, self)
    end
  end

  def position_knights(colour)
  	case colour
  	  when :white then
  	  @columns[1][0] = Knight.new(:white, self)
  	  @columns[6][0] = Knight.new(:white, self)
  	  when :black then
  	  @columns[1][7] = Knight.new(:black, self)
  	  @columns[6][7] = Knight.new(:black, self)
  	end
  end

  def position_bishops(colour)
  	case colour
  	  when :white then
  	  @columns[2][0] = Bishop.new(:white, self)
  	  @columns[5][0] = Bishop.new(:white, self)
  	  when :black then
  	  @columns[2][7] = Bishop.new(:black, self)
  	  @columns[5][7] = Bishop.new(:black, self)
  	end
  end

  def position_queen(colour)
  	case colour
  	  when :white then
  	  @columns[3][0] = Queen.new(:white, self)
  	  when :black then
 		  @columns[3][7] = Queen.new(:black, self)
 		end
  end

  def position_king(colour)
  	case colour
  	  when :white then
  	  @columns[4][0] = King.new(:white, self)
  	  when :black then
  	  @columns[4][7] = King.new(:black, self)
  	end
  end

  def next_turn
  	case @turn
      when :white then @turn = :black
      when :black then @turn = :white
    end
  end

  def legal_move?(x, y, x_new, y_new)
    !piece_at(x, y).nil? && correct_turn(x, y) && in_bounds(x_new, y_new) && !matching_colours(x, y, x_new, y_new)
  end

  def in_bounds(x, y)
    x <= (@size - 1) && y <= (@size - 1) && x >= 0 && y >= 0
  end

  def correct_turn(x, y)
    piece_at(x, y).colour == @turn
  end

  def matching_colours(x, y, x_new, y_new)
    @columns[x][y] && @columns[x_new][y_new] && @columns[x][y].colour == @columns[x_new][y_new].colour
  end

  def piece_at(x, y)
    @columns[x][y]
  end

  def set_piece_at(x, y, piece)
    return true if @columns[x][y] == piece
    if @columns[x][y]
      take(x, y, piece)
    else
      @columns[x][y] = piece
    end
  end
  
  def delete_piece_at(x, y)
    @columns[x][y] = nil
  end

  def take(x, y, piece)
    @taken << piece_at(x, y)
    @columns[x][y] = piece
  end
end
