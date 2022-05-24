require './lib/board'
require './lib/ship'
require './lib/cells'

RSpec.describe Board do

  it "board exists" do
    board = Board.new(4, "D")

    expect(board).to be_instance_of(Board)
  end

  it 'board has hash of coordinates' do
    board = Board.new(4, "D")
    board.create_cells

    expect(board.cells.length).to eq(16)
    expect(board.cells).to include("A1")
    expect(board.cells).to include("D4")
  end

   it 'valid_coordinate? checks if coordinates exist in cells' do
    board = Board.new(4, "D")
    board.create_cells

    expect(board.valid_coordinate?("A1")).to be(true)
    expect(board.valid_coordinate?("A5")).to be(false)
  end

  it 'valid_placement IDs incorrect placements based on ship size' do
    board = Board.new(4, "D")
    board.create_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
    expect(board.valid_placement?(cruiser, ["B1", "B2", "B3"])).to be(true)
  end

  it 'valid_placement IDs incorrect placements based on non consecutive coordinates' do
    board = Board.new(4, "D")
    board.create_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be(false)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
  end

  it 'valid_placement IDs correct placement' do
    board = Board.new(4, "D")
    board.create_cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be(true)
  end

  it 'place works to place the same ship object in multiple cells' do
    board = Board.new(4, "D")
    board.create_cells
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cell_3.ship)
    expect(cell_3.ship).to eq(cell_2.ship)
  end

  it 'checks if valid_placement? catches overlapping placements' do
    board = Board.new(4, "D")
    board.create_cells
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to be(false)
  end

  it 'render prints the correct output' do
    board = Board.new(4, "D")
    board.create_cells
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    expect(board.render).to eq("   1 2 3 4 \nA  . . . .\nB  . . . .\nC  . . . .\nD  . . . .\n")
    expect(board.render(true)).to eq("   1 2 3 4 \nA  S S S .\nB  . . . .\nC  . . . .\nD  . . . .\n")
  end
end
