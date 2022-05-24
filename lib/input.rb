require './lib/board'
require './lib/ship'

class Input


  attr_reader :computer_board, :player_board, :player_ships, :comp_ships
  attr_accessor :total_cells

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
    puts "                CREATE BOARD DIMENSIONS"
    puts "Select length for the high seas 4 - 10:"
    loop do
    range_num = gets.chomp.to_i
    if range_num > 10 || range_num < 4
      puts "Not in the defined range, please try again."
      redo
    else
      range1 = range_num
      break
    end
  end

  loop do
    puts "Select height for the high seas D - J:"
    range_letter = gets.chomp.upcase
    if range_letter.ord > 74 || range_letter.ord < 68 || range_letter.length >=2
      puts "Not in the defined range, please try again."
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
  puts "The seas are vast and your ships are few, would you like to add three more? Y/N"
  answer = gets.chomp.upcase
    if answer == "Y"
      if @total_cells >= 25
        3.times do
          system 'clear'
          puts "Please give a name for your new ship:"
          ship_name = gets.chomp.strip
          puts "Please give a length for #{ship_name}, you may select between 1-4:"
          loop do
            ship_length = gets.chomp.to_i
            if ship_length >= 5
            puts "#{ship_name} is too long, try again."
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
  end

  if @total_cells >= 50
    puts "The seas are vast and your ships are few, would you like to add three more? Y/N"
    answer = gets.chomp.upcase
    if answer == "Y"
      3.times do
        system 'clear'
        puts "Please give a name for your new ship:"
        ship_name = gets.chomp.strip
        puts "Please give a length for #{ship_name}, you may select between 1-4:"
        loop do
          ship_length = gets.chomp.to_i
          if ship_length >= 5
          puts "#{ship_name} is too long, try again."
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
      puts "The seas are vast and your ships are few, would you like to add three more? Y/N"
      answer = gets.chomp.upcase
      if answer == "Y"
      3.times do
        system 'clear'
        puts "Please give a name for your new ship:"
        ship_name = gets.chomp.strip
        puts "Please give a length for #{ship_name}, you may select between 1-4:"
        loop do
          ship_length = gets.chomp.to_i
          if ship_length >= 5
          puts "#{ship_name} is too long, try again."
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
        system 'clear'
        puts "Please give a name for your new ship:"
        ship_name = gets.chomp.strip
        puts "Please give a length for #{ship_name}, you may select between 1-4:"
        loop do
          ship_length = gets.chomp.to_i
          if ship_length >= 5
          puts "#{ship_name} is too long, try again."
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
end


  def ship_placement

    puts "        SELECT YOUR SHIP POSITIONS"
    puts @player_board.render(true)
    puts "Type your coordinates below one at a time and then hit ENTER after each coordinate."

    @player_ships.each do |ship|
      loop do
        puts @player_board.render(true)
        puts "=> The #{ship.name} is #{ship.ship_length} coordinates long."
      player_ship_coordinates = []
      ship.ship_length.times do
        coordinate = gets.chomp.upcase
        if @player_board.valid_coordinate?(coordinate) == false
          puts "Invalid coordinate. Try again."
          redo
        else
          player_ship_coordinates << coordinate
        end
      end

      if @player_board.valid_placement?(ship, player_ship_coordinates.min..player_ship_coordinates.max) == false
        puts "#{ship.name} placement is invalid"
      else
        @player_board.place(ship, player_ship_coordinates.min..player_ship_coordinates.max)
        puts "#{ship.name} placement successful!"
        break
      end
    end
  end

    puts "Your ships are ready for battle!"
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
          break
        end
      end
    end
      puts "Computer placed ship!"
  end

end
