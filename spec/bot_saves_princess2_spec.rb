require 'spec_helper'

describe "display_path_to_princess" do

	before :each do
	    @grid_size = 3
		@grid = [['-', 'm', '-'],
        ['-', '-', '-'],
        ['-', 'p', '-']]
        @bot_saves_princess = BotSavesPrincess2.new(@grid_size, @grid)
	end

	it "takes only odd number for size of grid" do
		is_even_number = @grid_size.odd?
		expect(is_even_number).to eql true
	end

	it "takes only number greater and equal to 3 and less than 100" do
		number = true if @grid_size >= 3 || @grid_size < 100
		expect(number).to eql true
	end

	it "check the position of bot, it should be in center of grid" do
		bot_position = @bot_saves_princess.find_bot_location
		expect(bot_position).not_to be_empty
	end

	it "check the postion of pricess, it should be inside grid" do
		princess_position = @bot_saves_princess.find_princess_location
		expect(princess_position).not_to be_empty
	end

	it "check bot reaching to princess" do
		bot_x, bot_y = @bot_saves_princess.find_bot_location
		princess_x, princess_y = @bot_saves_princess.find_princess_location
		bot_reached_to_princess = @bot_saves_princess.bot_finding_princess(bot_x, bot_y, princess_x, princess_y)
		expect(bot_reached_to_princess).to eql true
	end
end