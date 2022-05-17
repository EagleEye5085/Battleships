require './lib/ship'

RSpec.describe Ship do
  it 'ship exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'health and ship_length exist' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.ship_length).to eq(3)
    expect(cruiser.health).to eq(3)
  end

  it 'Sunk? returns false' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it 'hit decreases health' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'hit causes sunk? to return true' do
    cruiser = Ship.new("Cruiser", 3)
    3.times do
      cruiser.hit
    end

    expect(cruiser.sunk?).to eq(true)
  end
end
