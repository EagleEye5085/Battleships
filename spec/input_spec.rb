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
end
