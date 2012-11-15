require 'spec_helper'

describe Pawn do
	it "exists" do
		p = Pawn.new(:white)
		p.should_not be_nil
	end
end