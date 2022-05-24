require './lib/board'
require './lib/ship'

class Input


  attr_reader :computer_board, :player_board, :total_cells, :player_ships, :comp_ships

  def initialize
    @total_cells = nil
    @player_ships = []
    @comp_ships = []
    @player_board = []
    @computer_board = []
  end

  def create_boards
    range1 = 0
    range2 = ""
    p "select length"
    loop do
    range_num = gets.chomp.to_i
    if range_num > 10 || range_num < 4
      p "not correct"
      redo
    else
      range1 = range_num
      break
    end

  end

  loop do
    p "select height"
  range_letter = gets.chomp.upcase
  if range_letter.ord > 74 || range_letter.ord < 68 || range_letter.length >=2
    p "not between D and J"
    redo
  else
    range2 = range_letter
    break
  end

end
  @player_board = Board.new(range1, range2)
  player_board.create_cells
  @computer_board = Board.new(range1, range2)
  computer_board.create_cells
  @total_cells = player_board.cells.count

end

def create_ships

  if  @total_cells >= 16
    @player_ships << cruiser = Ship.new('cruiser', 3)
    @comp_ships << cruiser = Ship.new('cruiser', 3)
    @player_ships << submarine = Ship.new('submarine', 2)
    @comp_ships << submarine = Ship.new('submarine', 2)
  end

  if @total_cells >= 25
  puts "the seas are too large for your ships, would you like to add more? Y/N"
  answer = gets.chomp.upcase
  if answer == "Y"
    if @total_cells >= 25
      3.times do
        puts "please give a name for a ship"
        ship_name = gets.chomp
        puts "please give a length for #{ship_name}"
        loop do
          ship_length = gets.chomp.to_i
          if ship_length >= 5
          puts "ship too long"
          redo
          else
            @player_ships << new_ship = Ship.new(ship_name, ship_length)
            @comp_ships << new_ship = Ship.new(ship_name, ship_length)
            break
          end
        end
      end
    end

  if @total_cells >= 50
    puts "the seas are too large for your ships, would you like to add more? Y/N"
    answer = gets.chomp.upcase
    if answer == "Y"
    3.times do
      puts "please give a name for a ship"
      ship_name = gets.chomp
      puts "please give a length for #{ship_name}"
      loop do
        ship_length = gets.chomp.to_i
        if ship_length >= 5
        puts "ship too long"
        redo
        else
          @player_ships << new_ship = Ship.new(ship_name, ship_length)
          @comp_ships << new_ship = Ship.new(ship_name, ship_length)
          break
        end
      end
    end
  end
end
    if @total_cells >= 75
      puts "the seas are too large for your ships, would you like to add more? Y/N"
      answer = gets.chomp.upcase
      if answer == "Y"
      3.times do
        puts "please give a name for a ship"
        ship_name = gets.chomp
        puts "please give a length for #{ship_name}"
        loop do
          ship_length = gets.chomp.to_i
          if ship_length >= 5
          puts "ship too long"
          redo
          else
            @player_ships << new_ship = Ship.new(ship_name, ship_length)
            @comp_ships << new_ship = Ship.new(ship_name, ship_length)
            break
          end
        end
      end
    end
  end

  if @total_cells >= 100
    puts "the seas are too large for your ships, would you like to add more? Y/N"
    answer = gets.chomp.upcase
    if answer == "Y"
    3.times do
      puts "please give a name for a ship"
      ship_name = gets.chomp
      puts "please give a length for #{ship_name}"
      loop do
        ship_length = gets.chomp.to_i
        if ship_length >= 5
        puts "ship too long"
        redo
        else
          @player_ships << new_ship = Ship.new(ship_name, ship_length)
          @comp_ships << new_ship = Ship.new(ship_name, ship_length)
          break
        end
      end
    end
  end
end
#else here if needed
end
end
end


  def ship_placement

    puts "        SELECT YOUR SHIP POSITIONS"
    puts @player_board.render(true)
    puts "Type your coordinates below one at a time and then hit ENTER after each coordinate."

    @player_ships.each do |ship|
      loop do
        puts @player_board.render(true)
        puts " the #{ship.name} is #{ship.ship_length} grids long."
      player_ship_coordinates = []
      ship.ship_length.times do
        coordinate = gets.chomp.upcase
        if @player_board.valid_coordinate?(coordinate) == false
          puts "Invalid grid. Try again."
          redo
        else
          player_ship_coordinates << coordinate
        end
      end

      if @player_board.valid_placement?(ship, player_ship_coordinates) == false
        puts "#{ship.name} placement is invalid"
      else
        @player_board.place(ship, player_ship_coordinates)
        puts "#{ship.name} placement successful!"
        break
      end
    end
  end

    puts "Your ships are ready"
    puts @player_board.render(true)
  end

  def computer_place_ship

    @comp_ships.each do |ship|
    loop do
      computer_ship_coordinates = []
      ship.ship_length.times do
        coordinate = @computer_board.cells.keys.sample()
        if @computer_board.valid_coordinate?(coordinate) == false
          redo
        else
          computer_ship_coordinates << coordinate
        end
      end

      if @computer_board.valid_placement?(ship, computer_ship_coordinates) == false

      else
        @computer_board.place(ship, computer_ship_coordinates)
        puts "Computer placed ship!"
        break
      end
    end
  end
end
end
