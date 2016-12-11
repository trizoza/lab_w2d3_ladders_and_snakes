require_relative ('player.rb')
require_relative ('board.rb')

############## INPUT DEFINITION ###################

puts "Enter the name of the first player:"
name1 = gets.chomp

puts "Enter the name of the second player:"
name2 = gets.chomp

player1 = Player.new(name1)
player2 = Player.new(name2)
board = Board.new()
players = [player1, player2]
game = true
index2 = 13

############## GAME LOGIC ########################

while game == true

  for player in players
    
    puts "\n #{player.name()} your current position is #{player.position()}, roll the dice! [ENTER]"
    
    gets
    
    dice_number = player.roll_dice()
    
    puts "#{player.name()}, you rolled #{dice_number}"
    
    player.update_position(dice_number)
    
################# WIN CASE ########################

    if player.position() >= 17
      puts """#{player.name}, you passed the finish line, you won!


                         .|
                       .' |
                     .'   |
                     /`-._'
                    /   /
                   /   /
                  /   /
                 (`-./
                  )
                 ( 
                  '

                 """
      game = false
      break
    end
    
    inc = board.land_on_tile(player)
    
    player.update_position(inc)
    
    puts "Move to tile #{player.position()}"
    
################## GRAPHICS ########################

    grid =  "
    ______ _____ _____ _____ _____ 
   |FINISH|16   |15   |14   |13   |
   | %s  | %s | %s | %s | %s |
   |______|_____|_____|_____|_____|
          |9    |10   |11   |12   |
          | %s | %s | %s | %s |
          |_____|_____|_____|_____|
          |8    |7    |6    |5    |
          | %s | %s | %s | %s |  
     _____|_____|_____|_____|_____|
    |START|1    |2    |3    |4    |
    | %s | %s | %s | %s | %s |
    |_____|_____|_____|_____|_____|
    "

    board_array = Array.new(["   "]*18)

    if player == player1
      index1 = 13 if player.position() == 0
      index1 = 14 if player.position() == 1
      index1 = 15 if player.position() == 2
      index1 = 16 if player.position() == 3
      index1 = 17 if player.position() == 4

      index1 = 12 if player.position() == 5
      index1 = 11 if player.position() == 6
      index1 = 10 if player.position() == 7
      index1 = 9  if player.position() == 8
      
      index1 = 5 if player.position() == 9
      index1 = 6 if player.position() == 10
      index1 = 7 if player.position() == 11
      index1 = 8 if player.position() == 12

      index1 = 4 if player.position() == 13
      index1 = 3 if player.position() == 14
      index1 = 2 if player.position() == 15
      index1 = 1 if player.position() == 16
      index1 = 0 if player.position() == 17
    end

    if player == player2
      index2 = 13 if player.position() == 0
      index2 = 14 if player.position() == 1
      index2 = 15 if player.position() == 2
      index2 = 16 if player.position() == 3
      index2 = 17 if player.position() == 4

      index2 = 12 if player.position() == 5
      index2 = 11 if player.position() == 6
      index2 = 10 if player.position() == 7
      index2 = 9  if player.position() == 8
      
      index2 = 5 if player.position() == 9
      index2 = 6 if player.position() == 10
      index2 = 7 if player.position() == 11
      index2 = 8 if player.position() == 12

      index2 = 4 if player.position() == 13
      index2 = 3 if player.position() == 14
      index2 = 2 if player.position() == 15
      index2 = 1 if player.position() == 16
      index2 = 0 if player.position() == 17
    end
      
      if index1 == index2
        board_array[index1] = "#{player1.name[0].upcase} #{player2.name[0].upcase}"
        puts grid % board_array
        board_array[index1] = "   "
      else
        board_array[index1] = " #{player1.name[0].upcase} "
        board_array[index2] = " #{player2.name[0].upcase} "
        puts grid % board_array
        board_array[index1] = "   "
        board_array[index2] = "   "
      end

  end

end