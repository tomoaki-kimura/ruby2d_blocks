class State
  attr_reader :screen_status

  def initialize
    @screen_status = :main_title
  end

  def to_main_title
    @screen_status = :main_title
  end

  def to_game_start
    @screen_status = :game_start
  end
end