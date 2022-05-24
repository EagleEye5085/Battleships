require './lib/board'
require './lib/ship'
require './lib/cells'
require './lib/turn'
require './lib/input'

RSpec.describe Input do

  it "Input exists" do
    input = Input.new

    expect(input).to be_instance_of(Input)
  end

  it "it creates ships" do
    input = Input.new
    input.total_cells = 16
    input.create_ships

    expect(input.player_ships).to be_instance_of(Ship)
  end
end
