class Piece
	attr_accessor :colour

	def initialize(colour)
    @colour = colour
  end

  def legal?(x, y, x_new, y_new)
  	true
  end
end