require 'spec_helper'

describe Pawn do
	before :each do
		@board = Board.new
		@board.columns[2][1] = Pawn.new(:white, @board) #this pawn is already here, but just to be sure.
		@pawn = @board.piece_at(2, 1)
		@black_pawn = Pawn.new(:black, @board)
	end

  describe "moving" do

	  it "cannot move backwards" do
		  @pawn.move(1, 0).should == false
	  end

	  it "cannot move sideways" do
	  	@pawn.move(2, 1).should == false
	  end

	  it "can move one space forward" do
      @pawn.move(2, 2).should_not == false
      @board.piece_at(2, 2).class.should == Pawn
	  	@board.piece_at(2, 2).colour.should == :white
	  end

	  it "can move two spaces forward" do
      @pawn.move(2, 3).should_not == false
      @board.piece_at(2, 3).class.should == Pawn
	  	@board.piece_at(2, 3).colour.should == :white
	  end

	  it "cannot move more than 2 spaces forward" do
	  	@pawn.move(2, 4).should == false
	  end

	  it "can move one square diagonally right if there is a piece to take" do
	  	@board.set_piece_at(3, 2, @black_pawn)
	  	@pawn.move(3, 2).should_not == false
	  	@board.piece_at(3, 2).class.should == Pawn
	  	@board.piece_at(3, 2).colour.should == :white
	  end

	  it "is deleted if it moves one square diagonally right if there is no piece to take" do
	  	@board.piece_at(3, 2).should be_nil
	  	@pawn.move(3, 2).should_not == false
	  	@board.piece_at(3, 2).should be_nil
	  end

	  it "can only move one square diagonally right" do
	  	@pawn.move(4, 3).should == false
	  end

	  it "can move one square diagonally left if there is a piece to take" do
	  	@board.set_piece_at(1, 2, @black_pawn)
	  	@pawn.move(1, 2).should_not == false
	  	@board.piece_at(1, 2).class.should == Pawn
	  	@board.piece_at(1, 2).colour.should == :white
		end

	  it "is deleted if it moves one square diagonally right if there is no piece to take" do
	  	@board.piece_at(1, 2).should be_nil
	  	@pawn.move(1, 2).should_not == false
	  	@board.piece_at(1, 2).should be_nil
	  end

		it "can only move one square diagonally left" do
			@pawn.move(0, 3).should == false
		end
	end
end
