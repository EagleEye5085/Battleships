require './lib/ship'
require './lib/cells'

RSpec.describe Cell do

  it "cell exists" do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it "has a coordinate" do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end
  #
  it "does not have a ship in it" do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end
  #
  it "is empty" do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end
  # #
  it "can contain a ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it "has not been fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  it "has been fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    cell.fire_upon

    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  it "renders grid status . " do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it "renders grid status M " do
    cell_1 = Cell.new("B4")

    cell_1.fire_upon

    expect(cell_1.render).to eq("M")
  end
  #
  it "renders grid status S " do
    cell_2 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
    expect(cell_2.render(true)).to eq("S")
  end
  #
  it "shows hits" do
    cell_2 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
  end

  it "shows sunk ships" do
    cell_2 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    3.times do
      cell_2.fire_upon
    end

    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
  end
end
