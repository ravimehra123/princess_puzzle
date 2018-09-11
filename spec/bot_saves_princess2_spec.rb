require 'spec_helper'

module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    out
  ensure
    $stdout = STDOUT
  end
end

describe '#next_move' do
  it 'test can output next move for princess above saver' do
    out = capture_stdout do
      bot_saves_princes = BotSavesPrincess2.new('3',
                                                '1 1',
                                                ['-p-',
                                                 '-m-',
                                                 '---'])
      bot_saves_princes.next_move
    end
    expect(out.string).to eq "UP\n"
  end
end

describe '#next_move' do
  it 'test can output next move for princess below saver' do
    out = capture_stdout do
      bot_saves_princes = BotSavesPrincess2.new('5',
                                                '2 1',
                                                ['-----',
                                                 '-----',
                                                 '-m---',
                                                 '-----',
                                                 'p----'])
      bot_saves_princes.next_move
    end
    expect(out.string).to eq "DOWN\n"
  end
end

describe '#next_move' do
  it 'test can output next move for princess left of saver' do
    out = capture_stdout do
      bot_saves_princes = BotSavesPrincess2.new('5',
                                                '2 3',
                                                ['-----',
                                                 '-----',
                                                 'p--m-',
                                                 '-----',
                                                 '-----'])
      bot_saves_princes.next_move
    end
    expect(out.string).to eq "LEFT\n"
  end
end

describe '#next_move' do
  it 'test can output next move for princess right of saver' do
    out = capture_stdout do
      bot_saves_princes = BotSavesPrincess2.new('5',
                                                '2 1',
                                                ['-----',
                                                 '-----',
                                                 '-m--p',
                                                 '-----',
                                                 '-----'])
      bot_saves_princes.next_move
    end
    expect(out.string).to eq "RIGHT\n"
  end
end
