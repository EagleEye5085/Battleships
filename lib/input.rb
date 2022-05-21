require './lib/board'
require './lib/ship'

class Input

  attr_reader

  def initialize
    @player_board = Board.new
    @player_board.create_cells
    @computer_board = Board.new
    @computer_board.create_cells
    @player_cruiser = Ship.new('cruiser', 3)
    @player_submarine = Ship.new('submarine', 2)
    @computer_cruiser = Ship.new('cruiser', 3)
    @computer_submarine = Ship.new('submarine', 2)

  end

  def ship_placement
    puts " please select ship positions.\n" +
    "The Cruiser is three grids long.\n" +
    "The Sub is two grids long."
    puts @player_board.render(true)
    puts "Enter your selections one at a time\n" + "in a line "
    puts "Place the Cruiser. It is three grids long."

    loop do
      player_cruiser_coordinates = []
      @player_cruiser.ship_length.times do
        coordinate = gets.chomp.upcase
        if @player_board.valid_coordinate?(coordinate) == false
          puts "Invalid grid. Try again."
          redo
        else
          player_cruiser_coordinates << coordinate
        end
      end

      if @player_board.valid_placement?(@player_cruiser, player_cruiser_coordinates) == false
        puts "Cruiser placement is invalid"
      else
        @player_board.place(@player_cruiser, player_cruiser_coordinates)
        puts "Cruiser placement successful!"
        break
      end
    end

    puts "Place the sub. It is two grids long."
    puts @player_board.render(true)

    loop do
      player_sub_coordinates = []
      @player_submarine.ship_length.times do
        coordinate = gets.chomp.upcase
        if @player_board.valid_coordinate?(coordinate) == false
          puts "Invalid grid. Try again."
          redo
        else
          player_sub_coordinates << coordinate
        end
      end

      if @player_board.valid_placement?(@player_submarine, player_sub_coordinates) == false
        puts "Submarine placement is invalid"
      else
        @player_board.place(@player_submarine, player_sub_coordinates)
        puts "Cruiser placement successful!"
        break
      end
    end

    puts "Your ships are ready"
    puts @player_board.render(true)
  end

  def computer_place_ship

    loop do
      computer_cruiser_coordinates = []
      @computer_cruiser.ship_length.times do
        coordinate = @computer_board.cells.keys.sample()
        if @computer_board.valid_coordinate?(coordinate) == false
          redo
        else
          computer_cruiser_coordinates << coordinate
        end
      end

      if @computer_board.valid_placement?(@computer_cruiser, computer_cruiser_coordinates) == false

      else
        @computer_board.place(@computer_cruiser, computer_cruiser_coordinates)
        puts "Computer placed Cruiser!"

        break
      end
    end

    loop do
      computer_sub_coordinates = []
      @computer_submarine.ship_length.times do
        coordinate = @computer_board.cells.keys.sample()
        if @computer_board.valid_coordinate?(coordinate) == false
          redo
        else
          computer_sub_coordinates << coordinate
        end
      end

      if @computer_board.valid_placement?(@computer_submarine, computer_sub_coordinates) == false
      else
        @computer_board.place(@computer_submarine, computer_sub_coordinates)
        puts "Computer placed Submarine!"

        break
      end
    end
  end

# require "pry"; binding.pry
# tested in pry with following commands
# test = new
# test.ship_placement
# test.computer_ship_placement
end








# def place_ship(choice1, choice2, choice3 = w) #to be moved to player class
#   @placed << choice1 #array
#   @placed << choice2
#     if choice3 != w
#       @placed << choice3
#     end
# end
#
# def check_choice_placement
#   if #valid_placement
#   @placed.each do |coordinate| #existing coordinate
#     @player_board.valid_coordinate?(coordinate)
#   end
#   #needs to match ship_length
#   #must be unoccupied
#   #must must be sequential non diagonal
# end
