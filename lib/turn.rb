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

attr_accessor :comp_choice, :player_choice, :player_chosen, :comp_chosen

  def initialize(player_choice, comp_choice)
    @comp_choice = comp_choice
    @player_choice = player_choice
    @player_chosen = []
    @comp_chosen = []
  end

  def check_choice(choice, board)
  #method
  end

  def report
  #method
  end

  def display(top_board, bottom_board)
    puts top_board.render #comp board
    puts '*********'
    puts bottom_board.render(true) #player board
  end
end
