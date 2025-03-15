class State
  attr_reader :screen_status, :stage_size
  attr_accessor :blocks_size, :stage

  def initialize
    @stage_size = 2
    @screen_status = :main_title
    self.blocks_size = 1
    self.stage = 1
  end

  def to_main_title
    @screen_status = :main_title
  end

  def to_game_start
    @screen_status = :game_start
  end

  def to_game_over
    @screen_status = :game_over
  end

  def to_stage_loading
    @screen_status = :stage_loading
  end
end