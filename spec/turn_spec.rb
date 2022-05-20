require './lib/board'
require './lib/ship'
require './lib/cells'
require './lib/turn'

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

  # describe 'user_input' do
  #     it 'returns appropriate output for input recieved' do
  #     # With lib/player.rb:10 commented out
  #
  #      allow($stdin).to receive(:gets).and_return("A")
  #         user_input = $stdin.gets
  #         expect(@player.user_input).to eq(0)
  #
  #       allow($stdin).to receive(:gets).and_return("D")
  #         user_input = $stdin.gets
  #         expect(@player.user_input).to eq(3)
  #     end
  #   end
  it "player takes a valid shot" do
  turn = Turn.new
  @comp_board = Board.new
  @comp_board.create_cells
  allow($stdin).to receive(:gets).and_return("A2")
  shot_called = $stdin.gets

  expect(turn.call_shot).to eq("Invalid")
end

end
