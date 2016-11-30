class Board

  attr_reader :number_of_tiles, :tile_consequences

  def initialize()
    @number_of_tiles = 16
    @tile_consequences = [0,9,0,0,-2,3,0,6,0,-3,0,0,-2,0,-4,0]
  end

  def land_on_tile(player)
    pos = player.position()
    action = @tile_consequences[pos-1]
    puts "#{player.name()} you are lucky, you land on a ladder that takes you #{action} tiles ahead!" if action > 0
    puts "#{player.name()} you are unlucky, you land on a snake, move #{action.abs()} tiles back!" if action < 0
    return action
  end

end