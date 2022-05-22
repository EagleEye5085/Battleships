require './lib/input'
require './lib/cells'

class Turn

attr_accessor :player_board, :comp_board, :input

  def initialize
    @input = Input.new
    @comp_board = @input.computer_board
    @player_board = @input.player_board
  end

  def call_shot
    loop do
      p "Type in a coordinate to fire upon, if ye be feeling lucky."
      shot_called = gets.chomp.upcase
      if @comp_board.valid_coordinate?(shot_called) && @comp_board.cells[shot_called].fired_upon? == false
        take_shot(shot_called)
        break
      else
        p "Yarr you can't be firing there."
      end
    end
  end


  def take_shot(shot)
    @comp_board.cells[shot].fire_upon
    if @comp_board.cells[shot].empty? == false && @comp_board.cells[shot].ship.sunk? == true
      p "Ye sunk me ship!!"
    elsif @comp_board.cells[shot].empty? == true
      p "You Missed! You'll have to aim better than that, you Scurvy dog!"
    elsif @comp_board.cells[shot].empty? == false
      p "ARRR you hit my ship! Shiver me timbers, that's going to leave a mark!"
    else
      p "What are you doing?"
    end
  end

  def take_shot_computer
    shot = nil
    loop do
      shot = @player_board.cells.keys.sample()
      if @player_board.cells[shot].fired_upon? == false
        @player_board.cells[shot].fire_upon
        break
      end
    end
    if @player_board.cells[shot].empty? == false && @player_board.cells[shot].ship.sunk? == true
      p "I've sunk your ship. See you in Davy Jones' locker!"
    elsif @player_board.cells[shot].empty? == false
      p "A Hit! Ye be one step closer to the briney deep!"
    elsif @player_board.cells[shot].empty? == true
      p "Aargh I missed, I'll get you next time!"
    end
  end

  def display(top_board, bottom_board)
    fancy_divider1 = '~^~^~ Computer Board‍ ~^~^~'
    comp_board = top_board.render
    fancy_divider2 = '~^~^~ Player Board ~^~^~'
    player_board = bottom_board.render(true)
    fancy_divider3 = '~^~^~^~^~^~^~^~^~~^~^~^~'
    output = "#{fancy_divider1}\n#{comp_board}#{fancy_divider2}\n#{player_board}#{fancy_divider3}"
    puts output
    output
  end
end
