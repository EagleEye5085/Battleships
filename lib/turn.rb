# A single turn consists of...
# Displaying the boards
# Player choosing a coordinate to fire on
# Computer choosing a coordinate to fire on
# Reporting the result of the Player’s shot
# Reporting the result of the Computer’s shot

# Turn:
#
# User board is displayed showing hits, misses, sunken ships, and ships
# Computer board is displayed showing hits, misses, and sunken ships
# Computer chooses a random shot
# Computer does not fire on the same spot twice
# User can choose a valid coordinate to fire on
# Entering invalid coordinate prompts user to enter valid coordinate
# Both computer and player shots are reported as a hit, sink, or miss
# User is informed when they have already fired on a coordinate
# Board is updated after a turn

class Turn

attr_accessor :player_board, :comp_board, :computer, :player

  def initialize
    @player_board = Board.new
    @comp_board = Board.new
    # @computer = Computer.new(@comp_board)
    # @player = Player.new(@player_board)

    # @comp_choice = comp_choice
    # @player_choice = player_choice
    # @player_chosen = []
    # @comp_placed = []
    # @comp_chosen = []
  end

  # def place_ship(choice1, choice2, choice3 = w) #to be moved to player class
  #   @placed << choice1 #array
  #   @placed << choice2
  #     if choice3 != w
  #       @placed << choice3
  #     end
  # end
  #
  # def check_choice_placement
  #   if #valid_placement
  #   @placed.each do |coordinate| #existing coordinate
  #     @player_board.valid_coordinate?(coordinate)
  #   end
  #   #needs to match ship_length
  #   #must be unoccupied
  #   #must must be sequential non diagonal
  # end


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



  def report
    #report
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
