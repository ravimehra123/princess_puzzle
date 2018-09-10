# Bot saving princess class
class BotSavesPrincess2
  def initialize(grid_size, grid)
    @grid_size = grid_size
    @grid = grid
  end

  def find_bot_location
    @grid.each_index do |x|
      @row = x
      @column = @grid[x].index 'm'
      break unless @column.nil?
    end
    raise 'Location of bot not found' if @column.nil?

    return @row, @column
  end

  def find_princess_location
    @grid.each_index do |x|
      @row = x
      @column = @grid[x].index 'p'
      break unless @column.nil?
    end
    raise 'Location of princess not found' if @column.nil?

    return @row, @column
  end

  def bot_finding_princess(bot_x, bot_y, princess_x, princess_y)
    return true if bot_x == princess_x && bot_y == princess_y

    if bot_y < princess_y
      puts 'Right'
      bot_y += 1
    elsif bot_y > princess_y
      puts 'LEFT'
      bot_y -= 1
    elsif bot_x < princess_x
      puts 'DOWN'
      bot_x += 1
    elsif bot_x > princess_x
      puts 'UP'
      bot_x -= 1
    end
    bot_finding_princess(bot_x, bot_y, princess_x, princess_y)
  end

  def display_path_to_princess
    raise 'Number should be an odd number' if @grid_size.even?

    if @grid_size < 3 || @grid_size > 100
      raise 'Number should be between (3 >= n < 100)'
    end

    bot_x, bot_y = find_bot_location
    princess_x, princess_y = find_princess_location
    bot_finding_princess(bot_x, bot_y, princess_x, princess_y)
  end
end

grid_size = 5
grid = [['-', 'm', '-'],
        ['-', '-', '-'],
        ['-', 'p', '-']]
bot_saves_princes2 = BotSavesPrincess2.new(grid_size, grid)
bot_saves_princes2.display_path_to_princess
