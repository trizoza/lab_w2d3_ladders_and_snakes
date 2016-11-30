class Player

  attr_reader :name
  attr_accessor :position

  def initialize(name, position = 0)
    @name = name
    @position = position
  end

  def roll_dice()
    return rand(6) + 1
  end

  def update_position(increment)
    @position += increment
  end

end