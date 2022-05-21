require './lib/input'

class Turn

attr_accessor :player_board, :comp_board,

  def initialize
    @input = Input.new
    @comp_board = @input.computer_board
    @player_board = @input.player_board
  end

  def call_shot
    loop do
      shot_called = gets.chomp.upcase
      if @comp_board.valid_coordinate?(shot_called) && @comp_board.cells[shot_called].fired_upon? == false
        take_shot(shot_called)
      else
        p "Invalid shot."
      end
    end
  end


  def take_shot(shot)
    @computer_board.cells[shot].fire_upon
    if @computer_board.cells[shot].empty? == false
      p "ARRR, Shiver me timbers! That's going to leave a mark!"
    elsif @computer_board.cells[shot].empty? == true
      p "You Missed! You'll have to aim better than that, you Scurvy dog!"
    elsif @computer_board.cells[shot].ship.sunk? == true
      p "Ye sunk me ship!! "
    else
      "What are you doing?"
      call_shot
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
