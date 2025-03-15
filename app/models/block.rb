class Block < Rectangle
  attr_accessor :is_active, :is_breakable

  def initialize
    super
    self.is_active = true
    self.is_breakable = true
    self.x = 50
    self.y = 45
    self.width = 50
    self.height = 15
  end

  def self.start(state)
    data = CSV.read("app/maps/stage_#{state.stage}.csv")
    map = data.map { |row| row.map(&:to_i) }
    blocks = self.blocks(map, state)
    if state.stage >= state.stage_size
      state.stage = 1
    else
      state.stage += 1
    end
    blocks
  end

  def hit(ball, state)
    if bottom_hit?(ball)
      state.blocks_size -= 1 if self.is_active && self.is_breakable
      self.reject_block_and_refrect_up_to_down(ball)
    end
    if top_hit?(ball)
      state.blocks_size -= 1 if self.is_active && self.is_breakable
      self.reject_block_and_refrect_down_to_up(ball)
    end
    if left_hit?(ball)
      state.blocks_size -= 1 if self.is_active && self.is_breakable
      self.reject_block_and_refrect_right_to_left(ball)
    end
    if right_hit?(ball)
      state.blocks_size -= 1 if self.is_active && self.is_breakable
      self.reject_block_and_refrect_left_to_right(ball)
    end
  end

  private

  def self.blocks(maps, state)
    blocks = maps.map.with_index(0) do |row, i|
      row.map.with_index(0) do |col, n|
        block = self.new
        block.x = block.x + block.width * n
        block.width -= 1
        block.color = self.colors[i]
        block.y = block.y + block.height * i
        block.height -= 1
        if col == 0
          block.is_active = false
          block.remove
        elsif col == 2
          block.is_breakable = false
          block.color = "silver"
        elsif col == 1
          state.blocks_size += 1
        end
        block
      end
    end
    blocks.flatten
  end

  def self.colors
    ["red", "orange", "yellow", "green", "olive", "blue", "purple"]
  end

  def block_break_if_breakable 
    if self.is_breakable
      self.is_active = false
      self.remove
    end
  end

  def reject_block_and_refrect_up_to_down(ball)
    ball.y_flug = true
    self.block_break_if_breakable
    ball.score_display.remove
    ball.score += 10
    ball.score_reload
  end

  def reject_block_and_refrect_down_to_up(ball)
    ball.y_flug = false
    self.block_break_if_breakable
    ball.score_display.remove
    ball.score += 10
    ball.score_reload
  end

  def reject_block_and_refrect_left_to_right(ball)
    ball.x_flug = true
    self.block_break_if_breakable
    ball.score_display.remove
    ball.score += 10
    ball.score_reload
  end

  def reject_block_and_refrect_right_to_left(ball)
    ball.x_flug = false
    self.block_break_if_breakable
    ball.score_display.remove
    ball.score += 10
    ball.score_reload
  end

  def top_hit?(ball)
    ball.contains?(ball.x, self.y) && ball.x > self.x && ball.x < self.x + self.width
  end

  def bottom_hit?(ball)
    ball.contains?(ball.x, self.y + self.height) && ball.x > self.x && ball.x < self.x + self.width
  end

  def left_hit?(ball)
    ball.contains?(self.x, ball.y) && ball.y > self.y && ball.y < self.y + self.height
  end

  def right_hit?(ball)
    ball.contains?(self.x + self.width, ball.y) && ball.y > self.y && ball.y < self.y + self.height
  end
end