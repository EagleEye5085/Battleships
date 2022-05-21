

class Turn

attr_accessor :player_board, :comp_board, :computer, :player

  def initialize
  
    # @computer = Computer.new(@comp_board)
    # @player = Player.new(@player_board)
  end

  #

  def call_shot
      shot_called = $stdin.gets.chomp
      if @comp_board.valid_coordinate?(shot_called) && @comp_board.cells[shot_called].fired_upon? == false
        take_shot(shot_called)
      else
        p "Invalid"
      end
    end
    #require "pry"; binding.pry


  def take_shot(shot)
    @computer_board.cells[shot].fire_upon
    if @computer_board.cells[shot].empty? ==false
      p "You Hit!"
      # if fjyfg
      # end
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
