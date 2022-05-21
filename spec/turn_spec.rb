require './lib/board'
require './lib/ship'
require './lib/cells'
require './lib/turn'
require './lib/input'

RSpec.describe Turn do

  it 'displays both boards' do
    turn = Turn.new
    cruiser = Ship.new("Cruiser", 3)
    turn.player_board.create_cells
    turn.comp_board.create_cells
    turn.player_board.place(cruiser, ["A1", "A2", "A3"])
    turn.comp_board.place(cruiser, ["A1", "A2", "A3"])


    expect(turn.display(comp_board,player_board)).to eq("~^~^~ Computer Board‍ ~^~^~\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n~^~^~ Player Board ~^~^~\n  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n~^~^~^~^~^~^~^~^~~^~^~^~")
  end


end
