require './lib/ship'
require './lib/cells'
require './lib/board'
require './lib/turn'
require './lib/input'


class Battleship

  def initialize
  @turn = Turn.new
  end

  def intro
    system 'clear'
    puts "===================================================================
    ===================================================================
    Avast ye, salty dog! Ye be haul'n vast stores of the Queen's booty!
    If you lily-livered son of a biscuit eater's dont hand over your
    coffers, ye be given no quarter!"

    puts "
                  |    |    |
                 )_)  )_)  )_)
                )___))___))___)\\
               )____)____)_____)\\\\
             _____|____|____|____\\\\\\\__
    ---------\\                   /---------
      ^^^^^ ^^^^^^^^^^^^^^^^^^^^^
        ^^^^      ^^^^     ^^^    ^^
             ^^^^      ^^^"

    sleep(2)
    puts "

    Will you hand over the Queen's gold? Y/N"

    intro = gets.chomp.downcase
    system 'clear'

    if intro == "y"
      puts "  AAAAAHHHHH HAHAHA, I knew ye was too yella bellied to put up a fight!
    Ye landlubbers are free to go, give the Queen my regards.

    ~~~*** GAME OVER ***~~~
    ===================================================================
    ==================================================================="
    elsif intro == "n"
      puts "  So Ye wants a fight do ya. Batten down the hatches!
      All hands hoay! Raise the Jolly Roger!
      Prepare to meet Davy Jones, ye be in Davy Jones' locker by sundown!"
      gameloop
    end
  end

  def gameloop
    @turn.input.ship_placement
    @turn.input.computer_place_ship
    loop do
      @turn.display(@turn.comp_board, @turn.player_board)
      @turn.call_shot
      @turn.take_shot_computer
      if @turn.input.player_cruiser.sunk? == true && @turn.input.player_submarine.sunk? == true || @turn.input.computer_cruiser.sunk? == true && @turn.input.computer_submarine.sunk? == true
        break
      end
    end
    outro
  end

  def outro
    if @turn.input.player_cruiser.sunk? == true && @turn.input.player_submarine.sunk? == true
      p "HAHAHA, Enjoy the briney deep! You never should have crossed swords with our fearsome crew!"

    elsif @turn.input.computer_cruiser.sunk? == true && @turn.input.computer_submarine.sunk? == true
      p "You have saved the Queen's gold. You will be rewarded handsomely!"
    end
  end

end
