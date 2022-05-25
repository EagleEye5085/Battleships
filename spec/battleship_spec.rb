require './lib/battleship'

RSpec.describe Battleship do

  it "Battleship exists" do
    battleship = Battleship.new

    expect(battleship).to be_instance_of(Battleship)
  end
end
