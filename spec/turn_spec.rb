require './lib/board'
require './lib/ship'
require './lib/cells'
require './lib/turn'

RSpec.describe Turn do

  it 'displays the both boards' do
    player_board = Board.new
    comp_board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    player_board.create_cells
    comp_board.create_cells
    player_board.place(cruiser, ["A1", "A2", "A3"])
    comp_board.place(cruiser, ["A1", "A2", "A3"])
      turn = Turn.new("A3", "B2")
    turn.display(comp_board,player_board)
# require 'pry'; binding.pry


  end
end
