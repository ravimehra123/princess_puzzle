# Bot saving princess class
class BotSavesPrincess1
  def initialize(grid_size, grid)
    @grid_size = grid_size
    @grid = grid
  end

  def find_bot_location
    center = @grid_size / 2
    raise 'Position of bot is not in center' unless @grid[center][center] == 'm'

    center
  end

  def find_princess_location
    return 0, 0 if @grid[0][0] == 'p'
    return 0, @grid_size - 1 if @grid[0][@grid_size - 1] == 'p'
    return @grid_size - 1, 0 if @grid[@grid_size - 1][0] == 'p'
    if @grid[@grid_size - 1][@grid_size - 1] == 'p'
      return @grid_size - 1, @grid_size - 1
    end
    raise 'Could not find the princess in any corner'
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
    bot_x = bot_y = find_bot_location
    princess_x, princess_y = find_princess_location
    p bot_finding_princess(bot_x, bot_y, princess_x, princess_y)
  end
end

grid_size = 3
grid = [['-', '-', '-'],
        ['-', 'm', '-'],
        ['p', '-', '-']]
bot_saves_princess1 = BotSavesPrincess1.new(grid_size, grid)
bot_saves_princess1.display_path_to_princess
