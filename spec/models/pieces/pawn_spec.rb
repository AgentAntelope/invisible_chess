require 'spec_helper'

describe Pawn do
	before :each do
		@board = Board.new
		@board.columns[2][1] = Pawn.new(:white, @board) #this pawn is already here, but just to be sure.
		@pawn = @board.columns[2][1]
	end

  describe "moving" do

	  it "cannot move backwards" do
		  @pawn.move(2, 1, 1, 0).should == false
	  end

	  it "cannot move sideways" do
	  	@pawn.move(2, 1, 2, 1).should == false
	  end

	  it "can move one space forward" do
      @pawn.move(2, 1, 2, 2).should_not == false
      @board.columns[2][2].class.should == Pawn
	  	@board.columns[2][2].colour.should == :white
	  end

	  it "can move two spaces forward" do
      @pawn.move(2, 1, 2, 3).should_not == false
      @board.columns[2][3].class.should == Pawn
	  	@board.columns[2][3].colour.should == :white
	  end

	  it "cannot move more than 2 spaces forward" do
	  	@pawn.move(2, 1, 2, 4).should == false
	  end

	  it "can move one square diagonally right if there is a piece to take" do
	  	@board.columns[3][2] = Piece.new(:black)
	  	@pawn.move(2, 1, 3, 2).should_not == false
	  	@board.columns[3][2].class.should == Pawn
	  	@board.columns[3][2].colour.should == :white
	  end

	  it "is deleted if it moves one square diagonally right if there is no piece to take" do
	  	@board.columns[3][2].should be_nil
	  	@pawn.move(2, 1, 3, 2).should_not == false
	  	@board.columns[3][2].should be_nil
	  end

	  it "can only move one square diagonally right" do
	  	@pawn.move(2, 1, 4, 3).should == false
	  end

	  it "can move one square diagonally left if there is a piece to take" do
	  	@board.columns[1][2] = Piece.new(:black)
	  	@pawn.move(2, 1, 1, 2).should_not == false
	  	@board.columns[1][2].class.should == Pawn
	  	@board.columns[1][2].colour.should == :white
		end

	  it "is deleted if it moves one square diagonally right if there is no piece to take" do
	  	@board.columns[1][2].should be_nil
	  	@pawn.move(2, 1, 1, 2).should_not == false
	  	@board.columns[1][2].should be_nil
	  end

		it "can only move one square diagonally left" do
			@pawn.move(2, 1, 0, 3).should == false
		end
	end
end