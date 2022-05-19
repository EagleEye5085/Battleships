require './lib/ship'
require './lib/cells'
require './lib/board'


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
end
# require 'pry'; binding.pry
