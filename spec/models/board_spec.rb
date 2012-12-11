require 'spec_helper'

describe Board do
  before :each do
		@board = Board.new
	end

  describe "board properties" do
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
  	describe "white pieces" do
  		it "has 8 white pawns" do
  	    (0..7).each do |i|
 	   	  	@board.piece_at(i, 1).class.should == Pawn
 	 	    	@board.piece_at(i, 1).colour.should == :white
    	  end
  		end

  		it "has 2 rooks" do
        @board.piece_at(0, 0).class.should == Rook
        @board.piece_at(7, 0).class.should == Rook
        @board.piece_at(0, 0).colour.should == :white
				@board.piece_at(7, 0).colour.should == :white
  		end

  		it "has 2 knights" do
        @board.piece_at(1, 0).class.should == Knight
        @board.piece_at(6, 0).class.should == Knight
        @board.piece_at(1, 0).colour.should == :white
				@board.piece_at(6, 0).colour.should == :white
  		end

  		it "has 2 bishops" do
        @board.piece_at(2, 0).class.should == Bishop
        @board.piece_at(5, 0).class.should == Bishop
        @board.piece_at(2, 0).colour.should == :white
				@board.piece_at(5, 0).colour.should == :white
  		end

  		it "has a queen" do
  			@board.piece_at(3, 0).class.should == Queen
  			@board.piece_at(3, 0).colour.should == :white
  		end

  		it "has a king" do
  			@board.piece_at(4, 0).class.should == King
  			@board.piece_at(4, 0).colour.should == :white
  		end
  	end

  	describe "black pieces" do
  		it "has 8 black pawns" do
    	  (0..7).each do |i|
      		@board.piece_at(i, 6).class.should == Pawn
      		@board.piece_at(i, 6).colour.should == :black
    	 	end
  		end

  		it "has 2 rooks" do
        @board.piece_at(0, 7).class.should == Rook
        @board.piece_at(7, 7).class.should == Rook
        @board.piece_at(0, 7).colour.should == :black
				@board.piece_at(7, 7).colour.should == :black
  		end

  		it "has 2 knights" do
        @board.piece_at(1, 7).class.should == Knight
        @board.piece_at(6, 7).class.should == Knight
        @board.piece_at(1, 7).colour.should == :black
				@board.piece_at(6, 7).colour.should == :black
  		end

  		it "has 2 bishops" do
        @board.piece_at(2, 7).class.should == Bishop
        @board.piece_at(5, 7).class.should == Bishop
        @board.piece_at(2, 7).colour.should == :black
				@board.piece_at(5, 7).colour.should == :black
  		end

  		it "has a queen" do
  			@board.piece_at(3, 7).class.should == Queen
  			@board.piece_at(3, 7).colour.should == :black
  		end

  		it "has a king" do
  			@board.piece_at(4, 7).class.should == King
  			@board.piece_at(4, 7).colour.should == :black
  		end
    end
  end

  describe "#next_turn" do
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
  
  describe "#legal_move?" do
    before :each do
      @piece = Piece.new(:white, @board)
    end
      
    it "checks there is a piece to move" do
      @board.piece_at(4, 4).should be_nil
      @board.legal_move?(4, 4, 5, 5).should be_false
    end
    
    it "checks the turn is correct" do
      @board.turn.should == :white
      @board.set_piece_at(4, 4, @piece)
      @board.piece_at(4, 4).colour.should == :white
      @board.legal_move?(4, 4, 5, 5).should be_true
      @board.turn = :black
      @board.legal_move?(4, 4, 5, 5).should be_false
    end
    
    it "checks the move is within the bounds of the board" do
      @board.set_piece_at(4, 4, @piece)
      @board.legal_move?(4, 4, 8, 5).should   be_false
      @board.legal_move?(4, 4, -1, 5).should  be_false
      @board.legal_move?(4, 4, 5, 8).should   be_false
      @board.legal_move?(4, 4, 5, -1).should  be_false
      @board.legal_move?(4, 4, 8, 8).should   be_false
      @board.legal_move?(4, 4, -1, -1).should be_false
      @board.legal_move?(4, 4, 8, -1).should  be_false
      @board.legal_move?(4, 4, -1, 8).should  be_false
    end
    
    it "checks the piece is not taking one of it's own colour" do
      @board.set_piece_at(4, 4, @piece)
      @board.set_piece_at(4, 5, @piece)
      @board.legal_move?(4, 4, 4, 5).should be_false
    end
  end
end
