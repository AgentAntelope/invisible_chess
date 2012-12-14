require 'spec_helper'

describe Bishop do
	before :each do
		@board = Board.new
		@board.columns[3][3] = King.new(:white, @board)
    @king = @board.columns[3][3]
	end

  describe "moving" do
  	it "can move diagonally up right" do
  		@king.move(4, 4).should_not be_false
  	end

    it "can move diagonally up left" do
      @king.move(2, 4).should_not be_false
  	end

  	it "can move diagonally down left" do
  		@king.move(2, 2).should_not be_false
  	end

  	it "can move diagonally down right" do
  		@king.move(4, 2).should_not be_false
  	end

    it "can move forward one space" do
      @king.move(3, 4).should_not be_false
    end

    it "can move backwards one space" do
      @king.move(3, 2).should_not be_false
    end

    it "can move left one space" do
      @king.move(2, 3).should_not be_false
    end

    it "can move right one space" do
      @king.move(4, 3).should_not be_false
    end
  	
  	it "can only move one space" do
  		@king.move(5, 4).should be_false
      @king.move(5, 3).should be_false
  		@king.move(4, 5).should be_false
      @king.move(3, 5).should be_false
  		@king.move(1, 2).should be_false
      @king.move(1, 3).should be_false
  		@king.move(2, 1).should be_false
      @king.move(3, 1).should be_false
  	end
	end
end