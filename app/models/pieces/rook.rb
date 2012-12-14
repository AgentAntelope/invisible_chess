class Rook < Piece

	def legal?(x_new, y_new)
		return false unless @board.legal_move?(@x, @y, x_new, y_new)
		@x = x_new || @y = y_new
	end
end