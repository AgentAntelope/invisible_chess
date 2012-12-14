describe Knight do
	before :each do
		@board = Board.new
		@board.columns[4][4] = Knight.new(:white, @board)
    @knight = @board.columns[4][4]
	end

  describe "moving" do
  	it "can move up 2 right 1" do
  		@knight.move(6, 5).should_not be_false
  	end

    it "can move up 2 left 1" do
      @knight.move(6, 3).should_not be_false
  	end

  	it "can move down 2 left 1" do
  		@knight.move(2, 3).should_not be_false
  	end

  	it "can move down 2 right 1" do
  		@knight.move(2, 5).should_not be_false
  	end

    it "can move down 1 right 2" do
      @knight.move(3, 6).should_not be_false
    end

    it "can move down 1 left 2" do
      @knight.move(3, 2).should_not be_false
    end

    it "can move up 1 right 2" do
      @knight.move(5, 6).should_not be_false
    end

    it "can move up 1 left 2" do
      @knight.move(5, 2).should_not be_false
    end
  	
  	it "can only move in L-shapes" do
      @knight.move(5, 5).should be_false
  		@knight.move(5, 4).should be_false
      @knight.move(4, 5).should be_false
      @knight.move(4, 4).should be_false
  		@knight.move(3, 4).should be_false
      @knight.move(4, 3).should be_false
  		@knight.move(3, 3).should be_false
  	end
	end
end