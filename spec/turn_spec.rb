require './lib/board'
require './lib/ship'
require './lib/cells'
require './lib/turn'
require './lib/input'

RSpec.describe Turn do

  it 'displays both boards' do
    turn = Turn.new
    expect(turn.display(turn.comp_board, turn.player_board)).to eq("~^~^~ Computer Board‍ ~^~^~\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n~^~^~ Player Board ~^~^~\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n~^~^~^~^~^~^~^~^~~^~^~^~")
  end
