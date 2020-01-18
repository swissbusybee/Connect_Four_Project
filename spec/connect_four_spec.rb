# Tests are not complete as having issues given that the program is run instead.
# Will return to follow instructions using this [link](https://stackoverflow.com/questions/38319294/rspec-test-just-runs-entire-program)

require './lib/connect_four'
require './lib/string'
require 'spec_helper.rb'

RSpec.describe Player do

	before :each do
		@red = " \u25ce "
		@yellow = " \u25ce "
		@yellowPlayer = Player.new(@yellow)
		@redPlayer = Player.new(@red)
	end

	describe "#new" do
		it "takes color, makes player" do
			expect(@yellowPlayer).to be_an_instance_of Player
		end
	end

	describe "#take" do
		it "makes a space player color" do
			@yellowPlayer.take([0,0])
			expect(Player.board[0][0]).to eql(@yellow)
		end
	end

	describe "#group" do
		it "counts ascending in a row" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([3,0])
			@yellowPlayer.take([1,1])
			@yellowPlayer.take([2,0])
			expect(@yellowPlayer.group([2,0],-1,1)).to eql(2)
		end

		it "stops at 4" do
			@yellowPlayer.take([5,0])
			@yellowPlayer.take([4,1])
			@yellowPlayer.take([3,2])
			@yellowPlayer.take([2,3])
			@yellowPlayer.take([1,4])
			@yellowPlayer.take([0,5])
			expect(@yellowPlayer.group([5,0],-1,1)).to eql(4)
		end

		it "counts descending in a row" do
		  @yellowPlayer.take([0,0])
			@yellowPlayer.take([1,1])
			@yellowPlayer.take([2,2])
			@yellowPlayer.take([3,3])
			@yellowPlayer.take([4,4])
			@yellowPlayer.take([5,5])
			expect(@yellowPlayer.group([0,0],1,1)).to eql(4)
		end

		it "counts horizontally" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([0,1])
			@yellowPlayer.take([0,2])
			@yellowPlayer.take([0,3])
			@yellowPlayer.take([0,4])
			@yellowPlayer.take([0,5])
			expect(@yellowPlayer.group([0,0],0,1)).to eql(4)
		end

		it "counts vertically" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([1,0])
			@yellowPlayer.take([2,0])
			@yellowPlayer.take([3,0])
			@yellowPlayer.take([4,0])
			@yellowPlayer.take([5,0])
			expect(@yellowPlayer.group([0,0],1,0)).to eql(4)
		end

		it "handles edges" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([5,0])
			@yellowPlayer.take([0,5])
			@yellowPlayer.take([5,5])
			expect(@yellowPlayer.group([0,0],-1,1)).to eql(1)
			expect(@yellowPlayer.group([0,0],1,1)).to eql(1)
			expect(@yellowPlayer.group([0,0],1,0)).to eql(1)
			expect(@yellowPlayer.group([0,0],0,1)).to eql(1)
		end
	end

	describe "#win?" do

		it "wins ascending" do
			@yellowPlayer.take([5,0])
			@yellowPlayer.take([4,1])
			@yellowPlayer.take([3,2])
			@yellowPlayer.take([2,3])
			@yellowPlayer.take([1,4])
			@yellowPlayer.take([0,5])
			expect(@yellowPlayer.win?).to eql(true)
		end

		it "wins descending" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([1,1])
			@yellowPlayer.take([2,2])
			@yellowPlayer.take([3,3])
			@yellowPlayer.take([4,4])
			@yellowPlayer.take([5,5])
			expect(@yellowPlayer.win?).to eql(true)
		end

		it "wins horizontally" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([0,1])
			@yellowPlayer.take([0,2])
			@yellowPlayer.take([0,3])
			@yellowPlayer.take([0,4])
			@yellowPlayer.take([0,5])
			expect(@yellowPlayer.win?).to eql(true)
		end

		it "wins vertically" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([1,0])
			@yellowPlayer.take([2,0])
			@yellowPlayer.take([3,0])
			expect(@yellowPlayer.win?).to eql(true)
		end

		it "handles edges" do
			@yellowPlayer.take([0,0])
			@yellowPlayer.take([5,0])
			@yellowPlayer.take([0,5])
			@yellowPlayer.take([5,5])
			expect(@yellowPlayer.win?).to eql(false)
		end

	end

end
