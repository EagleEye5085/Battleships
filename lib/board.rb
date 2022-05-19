require './lib/cells'

class Board

  attr_reader :cells

  def initialize
    @cells = {}
  end

 def create_cells
   @range1 = 1..4
   @range2 = "A".."D"
   @range2.each do |letter|
     @range1.each do |number|
       @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    letters = coordinates.map { |coordinate| coordinate[0]}
    numbers = coordinates.map { |coordinate| coordinate[1].to_i}
    coordinate_empty = coordinates.map { |coordinate| @cells[coordinate].empty?}

    if ship.ship_length != coordinates.length
      false
    elsif coordinate_empty.include?(false) == true
     false
    elsif letters.uniq.length == 1 && (numbers.min..numbers.max).to_a == numbers
      true
    elsif numbers.uniq.length == 1 && (letters.min..letters.max).to_a == letters
      true
    elsif letters.uniq.length == 1 && numbers.uniq.length == 1
      false
    elsif (numbers.min..numbers.max).to_a == numbers && (letters.min..letters.max).to_a == letters
      false
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(bool = nil)
    p "  1 2 3 4 \n" + "A #{cells["A1"].render(bool)} #{cells["A2"].render(bool)} #{cells["A3"].render(bool)} #{cells["A4"].render(bool)} \n" + "B #{cells["B1"].render(bool)} #{cells["B2"].render(bool)} #{cells["B3"].render(bool)} #{cells["B4"].render(bool)} \n" + "C #{cells["C1"].render(bool)} #{cells["C2"].render(bool)} #{cells["C3"].render(bool)} #{cells["C4"].render(bool)} \n" + "D #{cells["D1"].render(bool)} #{cells["D2"].render(bool)} #{cells["D3"].render(bool)} #{cells["D4"].render(bool)} \n"
  end
end
