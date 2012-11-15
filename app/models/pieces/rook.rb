class Rook < Piece

	def legal?(x_position, y_position)
		if x_position = @x_position or y_position = @y_position
			true
		else
			false
		end
		@taking = true
	end
end