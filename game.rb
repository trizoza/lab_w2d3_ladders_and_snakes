require_relative ('player.rb')
require_relative ('board.rb')

grid =  "
 _____ _____ _____ _____
|1    |2    |3    |4    |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____| 
|5    |6    |7    |8    |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____|
|9    |10   |11   |12   |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____|
|13   |14   |15   |16   |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____|
"


puts "Enter the name of the first player:"
name1 = gets.chomp

puts "Enter the name of the second player:"
name2 = gets.chomp

player1 = Player.new(name1)
player2 = Player.new(name2)
board = Board.new()
players = [player1, player2]
ind2 = -1

game = true

while game == true

  for player in players
    puts "\n #{player.name()} your current position is #{player.position()}, roll the dice!"
    gets
    dice_number = player.roll_dice()
    puts "#{player.name()}, you rolled #{dice_number}"
    
    player.update_position(dice_number)

      puts """#{player.name()}, you passed the finish line, you won!\n
                  .
                .' |
              .'   |
              /`-._'
             /   /
            /   /
           /   /
          (`-./
           )
          '
      """ if player.position() >= 16
      game = false if player.position() >= 16
      break if player.position() >= 16   
   
      inc = board.land_on_tile(player)
      player.update_position(inc)
    
    puts "You move to tile #{player.position()}"
    
    board_array = Array.new(["  "]*16)

    ind1 = player.position() - 1 if player == player1
    ind2 = player.position() - 1 if player == player2
    
    if ind1 == ind2 
      board_array[ind1] = "XO"
      puts grid % board_array
      board_array[ind1] = "  "

    else
      board_array[ind1] = " X"
      board_array[ind2] = " O" if ind2 != -1
    puts grid % board_array
    board_array[ind1] = "  "
    board_array[ind2] = "  "

    end

  end


end