# Bot saving princess class
class BotSavesPrincess2
  attr_reader :grid_size, :bot_y, :bot_x, :grid

  def initialize(grid_size, bot_location, grid)
    @grid_size = grid_size
    @grid = grid
    @bot_y, @bot_x = extract_coordinates(bot_location)
  end

  def next_move
    princess_xy = []
    grid.each_with_index do |line, index|
      if line.include?('p')
        princess_xy.push(line.chars.index('p'))
        princess_xy.push(index)
      end
    end
    display_moves(princess_xy)
  end

  private

  def display_moves(princess_xy)
    cols = princess_xy[0] - bot_x
    rows = princess_xy[1] - bot_y
    if rows != 0
      move = rows < 0 ? 'UP' : 'DOWN'
      puts move
      return
    elsif cols != 0
      move = cols < 0 ? 'LEFT' : 'RIGHT'
      puts move
    end
  end

  def extract_coordinates(bot_location)
    bot_location.strip.split.map(&:to_i)
  end
end

grid_size = 3
bot_location = '1 1'
grid = ['-p-',
        '-m-',
        '---']
bot_saves_princes2 = BotSavesPrincess2.new(grid_size, bot_location, grid)
bot_saves_princes2.next_move
