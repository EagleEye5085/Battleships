require './lib/board'
require './lib/ship'
require './lib/cells'

RSpec.describe Board do

  it 'board has hash of coordinates' do
    board = Board.new
    board.create_cells

    expect(board.cells.length).to eq(16)
    expect(board.cells).to include("A1")
    expect(board.cells).to include("D4")
  end
end
