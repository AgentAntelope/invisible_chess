require 'spec_helper'

describe Queen do
	before :each do
		@board = Board.new
		@board.columns[3][3] = Queen.new(:white, @board)
    @queen = @board.columns[3][3]
	end

  describe "moving" do
  	it "can move diagonally up right" do
  		@queen.move(4, 4).should_not be_false
  	end

    it "can move diagonally up left" do
      @queen.move(2, 4).should_not be_false
  	end

  	it "can move diagonally down left" do
  		@queen.move(2, 2).should_not be_false
  	end

  	it "can move diagonally down right" do
  		@queen.move(4, 2).should_not be_false
  	end

    it "can move forward one space" do
      @queen.move(3, 4).should_not be_false
    end

    it "can move backwards one space" do
      @queen.move(3, 2).should_not be_false
    end

    it "can move left one space" do
      @queen.move(2, 3).should_not be_false
    end

    it "can move right one space" do
      @queen.move(4, 3).should_not be_false
    end
  	
  	it "can move forward more than one space" do
      @queen.move(3, 5).should_not be_false
    end

    it "can move backwards more than one space" do
      # by default there is a white piece here
      @board.columns[3][1] = Piece.new(:black, @board)
      @queen.move(3, 1).should_not be_false
    end

    it "can move left more than one space" do
      @queen.move(1, 3).should_not be_false
    end

    it "can move right more than one space" do
      @queen.move(5, 3).should_not be_false
    end
	end
end