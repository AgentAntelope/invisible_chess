class Piece
	attr_accessor :x_position, :y_position, :taking?
	def intialise(colour = "black")
	  @colour = colour
	end
		def move(x_position, y_position)
    if legal?(x_position, y_position)
    	@x_position = x_position
    	@y_position = y_position
    end
	end
	def legal?(x_position, y_position)
		false
	end
end