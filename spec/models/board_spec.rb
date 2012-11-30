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

  describe "#next_turn" do
    before :each do
      @board = Board.new
    end

    it "should go from white to black" do
      @board.turn = :white
      @board.next_turn
      @board.turn.should == :black
    end

    it "should go from black to white" do
      @board.turn = :black
      @board.next_turn
      @board.turn.should == :white
    end
  end
end