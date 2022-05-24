require './lib/board'
require './lib/ship'
require './lib/cells'
require './lib/turn'
require './lib/input'

RSpec.describe Turn do

  it "Turn exists" do
    turn = Turn.new

    expect(turn).to be_instance_of(Turn)
  end

end
