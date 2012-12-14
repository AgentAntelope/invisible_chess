require 'spec_helper'

describe Piece do
  before :each do
    @board = Board.new
  end

	it "has a colour" do
		Piece.new(:white, @board).colour.should == :white
		Piece.new(:black, @board).colour.should == :black
	end
end