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
    coordinate_empty? = coordinates.map { |coordinate| @cells[coordinate].empty?}

    if
  end



end




#h.each Call block once for each key in hash h, passing the key-value pair as parameters (option 1)
#h.each_key Call block once for each key in hash h, passing the key as a parameter
#h.each_value Call block once for each key in hash h, passing the value as a parameter
