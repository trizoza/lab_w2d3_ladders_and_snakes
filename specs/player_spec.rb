require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../player.rb')

class PlayerTest < MiniTest::Test

  def test_player_name
    player = Player.new("Peter")
    assert_equal("Peter", player.name())
  end

  def test_player_position
    player = Player.new("Andy")
    assert_equal(0, player.position())
  end

  def test_roll_dice
    player = Player.new("Nina")

    dice_number = player.roll_dice()
    
    assert_equal( true, dice_number <= 6)
    assert_equal( true, dice_number >= 1)
  end

  def test_update_position
    player = Player.new("Harr")

    player.update_position(3)
    inc = player.position()

    assert_equal(3, inc)
  end

end