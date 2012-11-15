require 'spec_helper'

describe Board do

  describe "board properties" do
		before :each do
		  @board = Board.new
	  end

		it "has 8 columns" do
			@board.columns.count.should == 8
		end

 	 it "has 8 rows" do
 		 	@board.columns.each do |row|
  			row.count.should == 8
  		end
  	end
  
 		it "should have white starting first" do
  		@board.turn.should == :white
  	end
  end

  describe "it has the right pieces in the right places" do
  	before :each do
		  @board = Board.new
	  end
  	describe "white pieces" do

  		it "has 8 white pawns" do
  	    (0..7).each do |i|
 	   	  	@board.columns[i][1].class.should == Pawn
 	 	    	@board.columns[i][1].colour.should == :white
    	  end
  		end

  		it "has 2 rooks" do
        @board.columns[0][0].class.should == Rook
        @board.columns[7][0].class.should == Rook
        @board.columns[0][0].colour.should == :white
				@board.columns[7][0].colour.should == :white
  		end

  		it "has 2 knights" do
        @board.columns[1][0].class.should == Knight
        @board.columns[6][0].class.should == Knight
        @board.columns[1][0].colour.should == :white
				@board.columns[6][0].colour.should == :white
  		end

  		it "has 2 bishops" do
        @board.columns[2][0].class.should == Bishop
        @board.columns[5][0].class.should == Bishop
        @board.columns[2][0].colour.should == :white
				@board.columns[5][0].colour.should == :white
  		end

  		it "has a queen" do
  			@board.columns[3][0].class.should == Queen
  			@board.columns[3][0].colour.should == :white
  		end

  		it "has a king" do
  			@board.columns[4][0].class.should == King
  			@board.columns[4][0].colour.should == :white
  		end
  	end

  	describe "black pieces" do

  		it "has 8 black pawns" do
    	  (0..7).each do |i|
      		@board.columns[i][6].class.should == Pawn
      		@board.columns[i][6].colour.should == :black
    	 	end
  		end

  		it "has 2 rooks" do
        @board.columns[0][7].class.should == Rook
        @board.columns[7][7].class.should == Rook
        @board.columns[0][7].colour.should == :black
				@board.columns[7][7].colour.should == :black
  		end

  		it "has 2 knights" do
        @board.columns[1][7].class.should == Knight
        @board.columns[6][7].class.should == Knight
        @board.columns[1][7].colour.should == :black
				@board.columns[6][7].colour.should == :black
  		end

  		it "has 2 bishops" do
        @board.columns[2][7].class.should == Bishop
        @board.columns[5][7].class.should == Bishop
        @board.columns[2][7].colour.should == :black
				@board.columns[5][7].colour.should == :black
  		end

  		it "has a queen" do
  			@board.columns[3][7].class.should == Queen
  			@board.columns[3][7].colour.should == :black
  		end

  		it "has a king" do
  			@board.columns[4][7].class.should == King
  			@board.columns[4][7].colour.should == :black
  		end
    end
  end

  describe "moving" do
  	# a Piece can move anywhere on the board that is permitted to all pieces
  	before :each do
  		@board = Board.new
  		@board.columns[7][7] = Piece.new(:white)
  	end
    describe "#can_move?" do

    	it "should not let you move onto your own pieces" do
    	  @board.can_move?(7, 7, 4, 4).should == true
    	  @board.columns[4][4] = Piece.new(:white)
    	  @board.can_move?(7, 7, 4, 4).should == false
    	end

    	it "should let you move onto your opponents pieces" do
    		@board.can_move?(7, 7, 4, 4).should == true
    	  @board.columns[4][4] = Piece.new(:black)
    	  @board.can_move?(7, 7, 4, 4).should == true
    	end

	    it "should only let you move on your turn" do
	    	@board.can_move?(7, 7, 4, 4).should == true
	      @board.turn = :black
	      @board.can_move?(7, 7, 4, 4).should == false
	    end

	  	it "should not allow you to move off the board" do
	  		@board.columns[7][7] = Piece.new(:white)
	  		@board.can_move?(7, 7, 8, 8).should be_false
	  		@board.can_move?(7, 7, 0, 8).should be_false
	  		@board.can_move?(7, 7, 8, 0).should be_false
	  		@board.can_move?(7, 7, 0, 0).should be_false
	  	end
	  end
  end
end