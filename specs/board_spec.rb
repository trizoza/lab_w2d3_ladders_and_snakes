require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../board.rb')
require_relative ('../player.rb')

class BoardTest < MiniTest::Test

  def test_length_of_consequences_array
    board = Board.new()
    assert_equal(18, board.tiles.length())
  end

  def test_land_on_plain_tile
    board = Board.new()
    player = Player.new("Dave")
    player.update_position(3)
    inc = board.land_on_tile(player)
    assert_equal(3, player.update_position(inc))
  end

  def test_land_on_ladder_tile
    board = Board.new()
    player = Player.new("Dave")
    player.update_position(2)
    inc = board.land_on_tile(player)
    assert_equal(11, player.update_position(inc))
  end

  def test_land_on_snake_tile
    board = Board.new()
    player = Player.new("Dave")
    player.update_position(5)
    inc = board.land_on_tile(player)
    assert_equal(3, player.update_position(inc))
  end

end