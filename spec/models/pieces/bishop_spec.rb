require 'spec_helper'

describe Bishop do
	before :each do
		@board = Board.new
		@board.columns[3][3] = Bishop.new(:white, @board)
		@bishop =  @board.columns[3][3]
	end

  describe "moving" do
  	it "can move diagonally up right" do
  		@bishop.move(4, 4).should_not == false
  	end

    it "can move diagonally up left" do
      @bishop.move(2, 4).should_not == false
  	end

  	it "can move diagonally down left" do
  		@bishop.move(2, 2).should_not == false
  	end

  	it "can move diagonally down right" do
  		@bishop.move(4, 2).should_not == false
  	end
  	
  	it "can only move diagonally" do
  		@bishop.move(2, 3).should == false
  		@bishop.move(3, 2).should == false
  		@bishop.move(3, 4).should == false
  		@bishop.move(4, 3).should == false
  		@bishop.move(5, 4).should == false
  		@bishop.move(4, 5).should == false
  		@bishop.move(1, 2).should == false
  		@bishop.move(2, 1).should == false
  	end
	end
end